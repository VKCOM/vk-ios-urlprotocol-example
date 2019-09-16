import Foundation

class ImageURLCache: URLCache {
    static var current = ImageURLCache()
    
    override init() {
        let MB = 1024 * 1024
        super.init(
            memoryCapacity: 2 * MB,
            diskCapacity: 100 * MB,
            diskPath: "imageCache"
        )
    }
    
    private static let accessQueue = DispatchQueue(
        label: "image-urlcache-access"
    )
    
    public override func cachedResponse(for request: URLRequest) -> CachedURLResponse? {
        return ImageURLCache.accessQueue.sync {
            return super.cachedResponse(for: request)
        }
    }
    
    public override func storeCachedResponse(_ response: CachedURLResponse, for request: URLRequest) {
        ImageURLCache.accessQueue.sync {
            super.storeCachedResponse(response, for: request)
        }
    }
}
