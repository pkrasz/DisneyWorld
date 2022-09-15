//
//  AppDelegate.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: CharacterCoordinator!
    var environment: CharactersEnvironment!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        environment = CharactersEnvironment(apiClient: ApiClient())
        coordinator = CharacterCoordinator(navigationController: navigationController, environment: environment)
        coordinator.start()
        

        return true
    }
}

