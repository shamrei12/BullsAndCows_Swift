//
//  AppDelegate.swift
//  BullAndCow
//
//  Created by Алексей Шамрей on 8.05.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
        navigationController.viewControllers = [rootViewController]
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
        
    }
    
}

