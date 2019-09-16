import MapKit

class MapURLBuilder {
    func buildURL(latitude: CLLocationDegrees, longitude: CLLocationDegrees, size: CGSize) -> URL {
        func item(_ key: MKMapSnapshotter.Options.Key, _ value: String) -> URLQueryItem {
            return URLQueryItem(name: key.rawValue, value: value)
        }
        
        var components = URLComponents()
        components.scheme = "map"
        components.queryItems = [
            item(.width, String(describing: size.width)),
            item(.height, String(describing: size.height)),
            item(.latitude, String(latitude)),
            item(.longitude, String(longitude)),
            item(.latitudeDelta, String(0.003)),
            item(.longitudeDelta, String(0.003)),
            item(.scale, String(describing: UIScreen.main.scale))
        ]
        
        return components.url!
    }
}
