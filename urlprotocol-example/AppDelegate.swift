import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let window = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller = ViewController(data: sampleMapsData)
        controller.title = "Maps"
        let navController = UINavigationController(rootViewController: controller)
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
        
        return true
    }
}
