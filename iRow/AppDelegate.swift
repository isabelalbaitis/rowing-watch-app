//
//  AppDelegate.swift
//  iRow
//
//  Created by Isabel Albaitis and Jacob Stone on 10/29/21.
//
import Firebase
import UIKit

let THEME_COLOR1 = UIColor.init(red:0.000, green:0.157, blue:0.216,
                                alpha:1.00)  // DARK BLUE
let THEME_COLOR2 = UIColor.init(red:0.000, green:0.369, blue:0.420,
                                alpha:1.00) // Light Tan
let THEME_COLOR3 = UIColor.init(red: 0.937, green: 0.820, blue: 0.576,
                                alpha: 1.0)  // Lighter Blue
let THEME_COLOR4 = UIColor.init(red:0.576, green:0.596, blue:0.329,
                                alpha:1.00) // Greenish Tan
let THEME_COLOR5 = UIColor.init(red:0.251, green:0.286, blue:0.141,
                                alpha:1.00)


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

