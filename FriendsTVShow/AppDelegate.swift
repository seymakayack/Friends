//
//  AppDelegate.swift
//  Friends
//
//  Created by Seyma on 14.01.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? // UIWindow tanımı

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = FriendsDetailsViewController()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

