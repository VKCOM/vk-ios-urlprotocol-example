import MapKit

extension MKMapSnapshotter.Options {
    public enum Key: String {
        case width = "width"
        case height = "height"
        case latitude = "latitude"
        case longitude = "longitude"
        case latitudeDelta = "latitude_delta"
        case longitudeDelta = "longitude_delta"
        case scale = "scale"
    }
}

extension MKMapSnapshotter.Options {
    public convenience init(items: [(Key, String?)]) {
        self.init()
        
        var width: CGFloat?
        var height: CGFloat?
        var lat: CLLocationDegrees?
        var lng: CLLocationDegrees?
        var latDelta: CLLocationDegrees?
        var lngDelta: CLLocationDegrees?
        var mapScale: CGFloat?
        
        func float(_ string: NSString) -> CGFloat {
            return CGFloat(string.floatValue)
        }
        
        for item in items {
            if let value = item.1 {
                let valueStr = NSString(string: value)
                switch item.0 {
                case .width:
                    width = float(valueStr)
                case .height:
                    height = float(valueStr)
                case .latitude:
                    lat = valueStr.doubleValue
                case .longitude:
                    lng = valueStr.doubleValue
                case .latitudeDelta:
                    latDelta = valueStr.doubleValue
                case .longitudeDelta:
                    lngDelta = valueStr.doubleValue
                case .scale:
                    mapScale = float(valueStr)
                }
            }
        }
        
        if let width = width, let height = height {
            size = CGSize(width: width, height: height)
        }
        
        if let lat = lat, let lng = lng, let latDelta = latDelta, let lngDelta = lngDelta {
            let center = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
            region = MKCoordinateRegion(center: center, span: span)
        }
        
        if let mapScale = mapScale {
            scale = mapScale
        }
        
        mapType = .hybrid
    }
}

extension MKMapSnapshotter {
    convenience init(queryItems: [URLQueryItem]) {
        self.init(options: MKMapSnapshotter.options(from: queryItems))
    }
    
    static func options(from queryItems: [URLQueryItem]) -> MKMapSnapshotter.Options {
        return MKMapSnapshotter.Options(items: queryItems.compactMap({
            if let key = MKMapSnapshotter.Options.Key(rawValue: $0.name) {
                return (key, $0.value)
            } else {
                return nil
            }
        }))
    }
}
