import MapKit

fileprivate let builder = MapURLBuilder()

fileprivate func buildURL(_ latitude: CLLocationDegrees, _ longitude: CLLocationDegrees) -> String {
    return builder.buildURL(latitude: latitude, longitude: longitude, size: CGSize(width: 100, height: 100)).absoluteString
}

let sampleMapsData: [String] = [
    buildURL(59.9396975, 29.5303037),
    buildURL(55.5815244, 36.8251256),
    buildURL(41.9102415, 12.395914),
    buildURL(51.5287718, -0.2416813),
    buildURL(52.354775, 4.7585405),
    buildURL(48.8589507, 2.2770202),
    buildURL(40.6976701, -74.2598656),
    buildURL(37.757815, -122.50764),
    buildURL(41.8339037, -87.8720478),
    buildURL(59.9394953, 30.3164115),
    buildURL(59.9396975, 29.5303037),
    buildURL(55.5815244, 36.8251256),
    buildURL(41.9102415, 12.395914),
    buildURL(51.5287718, -0.2416813),
    buildURL(52.354775, 4.7585405),
    buildURL(48.8589507, 2.2770202),
    buildURL(40.6976701, -74.2598656),
    buildURL(37.757815, -122.50764),
    buildURL(41.8339037, -87.8720478),
    buildURL(59.9394953, 30.3164115),
    buildURL(59.9396975, 29.5303037),
    buildURL(55.5815244, 36.8251256),
    buildURL(41.9102415, 12.395914),
    buildURL(51.5287718, -0.2416813),
    buildURL(52.354775, 4.7585405),
    buildURL(48.8589507, 2.2770202),
    buildURL(40.6976701, -74.2598656),
    buildURL(37.757815, -122.50764),
    buildURL(41.8339037, -87.8720478),
    buildURL(59.9394953, 30.3164115),
    buildURL(59.9396975, 29.5303037),
    buildURL(55.5815244, 36.8251256),
    buildURL(41.9102415, 12.395914),
    buildURL(51.5287718, -0.2416813),
    buildURL(52.354775, 4.7585405),
    buildURL(48.8589507, 2.2770202),
    buildURL(40.6976701, -74.2598656),
    buildURL(37.757815, -122.50764),
    buildURL(41.8339037, -87.8720478),
    buildURL(59.9394953, 30.3164115),
    buildURL(59.9396975, 29.5303037),
    buildURL(55.5815244, 36.8251256)
]
