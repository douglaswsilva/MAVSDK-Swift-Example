import UIKit
import Mavsdk
import MavsdkServer

var drone: Drone? = Optional.none

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mavsdkServer = MavsdkServer()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let port = mavsdkServer.run(systemAddress: "tcp://3.227.211.180:5790")
        drone = Drone(port: Int32(port))

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {
        self.mavsdkServer.stop()
    }
}
