//
//  AppDelegate.swift
//  Lifecycle
//
//  Created by Zolt Varga on 01/04/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Variables
    
    var window: UIWindow?
    private var startScreen: UIViewController = ViewController()
    private var appDelegates = [UIApplicationDelegate]()
    
    // MARK: - App Lifecycle
    
    override init() {
        super.init()
        print("🔵 AppDelegate \(#function)")
        
        // As every class AppDelegate also have init. E.g.: We can initilize some runtime properties.
        appDelegates = [
            MyCustomAppDelegate()
            // List of CustomAppDelegates
        ]
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // User taps on app icon or some OS event (push-notification, deeplink, background processing....) wakes up the app
        
        print("🔵 AppDelegate \(#function) State: \(UIApplication.shared.applicationState.toString())")
        
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // User taps on app icon or some OS event (push-notification, deeplink, background processing....) wakes up the app
        print("🔵 AppDelegate \(#function) State: \(UIApplication.shared.applicationState.toString())")
        
        // 1. Custom AppDelegates
        appDelegates.forEach { _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions) }
        
        // 2. Create 1st Screen
        window = UIWindow()
        window?.rootViewController = startScreen
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("🔵 AppDelegate \(#function) State: \(UIApplication.shared.applicationState.toString())")
        
        appDelegates.forEach { _ = $0.applicationDidBecomeActive?(application) }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("🔵 AppDelegate \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("🔵 AppDelegate \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("🔵 AppDelegate \(#function) State: \(UIApplication.shared.applicationState.toString())")
        
        // In case need some additional time for background processing
        application.beginBackgroundTask(expirationHandler: {
            print("Background time remaning: \(application.backgroundTimeRemaining)")
            application.endBackgroundTask(UIBackgroundTaskIdentifier.invalid)
        })
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        print("🔵 AppDelegate \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("🔵 AppDelegate \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
}

// MARK: - Notification
extension AppDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("🟣 AppDelegate \(#function)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("🟣 AppDelegate \(#function)")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("🟣 AppDelegate \(#function)")
    }
}

// MARK: - Action
extension AppDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        print("🟡 AppDelegate \(#function)")
        
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        print("🟡 AppDelegate \(#function)")
        
        return true
    }
}

// MARK: - Security
extension AppDelegate {
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        print("🔓 AppDelegate \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
        print("🔐 AppDelegate \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
}

// MARK: - Utility
extension AppDelegate {
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print("🟠 AppDelegate \(#function)")
        // try to clean up as much memory as possible. next step is to terminate app
    }
    
    func applicationSignificantTimeChange(_ application: UIApplication) {
        print("🟠 AppDelegate \(#function)")
        // midnight, carrier time update, daylight savings time change
    }
}

// MARK: - Debug/Helper
extension UIApplication.State {
    
    func toString() -> String {
        switch self {
            case .active: return "active"
            case .inactive: return "inactive"
            case .background: return "background"
            default: return "none"
        }
    }
}
