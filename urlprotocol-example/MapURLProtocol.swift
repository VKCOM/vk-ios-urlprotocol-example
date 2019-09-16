import MapKit

class MapURLProtocol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        return request.url?.scheme == "map"
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    var thread: Thread!
    
    override func startLoading() {
        guard let url = request.url,
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let queryItems = components.queryItems else {
                fail(with: .badURL)
                return
        }
        
        thread = Thread.current
        
        if let cachedResponse = cachedResponse {
            complete(with: cachedResponse)
        } else {
            load(with: queryItems)
        }
    }
    
    override func stopLoading() {
        isCancelled = true
    }
    
    var isCancelled: Bool = false
    
    func load(with queryItems: [URLQueryItem]) {
        let snapshotter = MKMapSnapshotter(queryItems: queryItems)
        snapshotter.start(
            with: DispatchQueue.global(qos: .background),
            completionHandler: handle
        )
    }
    
    func handle(snapshot: MKMapSnapshotter.Snapshot?, error: Error?) {
        thread.execute {
            if let snapshot = snapshot,
                let data = snapshot.image.jpegData(compressionQuality: 0.7) {
                self.complete(with: data)
            } else if let error = error {
                self.fail(with: error)
            }
        }
    }
    
    func complete(with cachedResponse: CachedURLResponse) {
        complete(with: cachedResponse.data)
    }
    
    func complete(with data: Data) {
        guard let url = request.url, let client = client else {
            return
        }
        
        let response = URLResponse(
            url: url,
            mimeType: "image/jpeg",
            expectedContentLength: data.count,
            textEncodingName: nil
        )
        
        client.urlProtocol(self, didReceive: response, cacheStoragePolicy: .allowed)
        client.urlProtocol(self, didLoad: data)
        client.urlProtocolDidFinishLoading(self)
    }
    
    func fail(with errorCode: URLError.Code) {
        let error = URLError(errorCode, userInfo: [:])
        fail(with: error)
    }
    
    func fail(with error: Error) {
        client?.urlProtocol(self, didFailWithError: error)
    }
}
