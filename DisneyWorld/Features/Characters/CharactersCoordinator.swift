//
//  CharactersCoordinator.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import Foundation
import UIKit

class CharacterCoordinator: Coordinator {
    
    //MARK: - Properties
    
    private let navigationController: UINavigationController
    private let environment: CharactersEnvironment
    
    //MARK: - Initializator
    
    init(navigationController: UINavigationController, environment: CharactersEnvironment) {
        self.navigationController = navigationController
        self.environment = environment
    }
    
    //MARK: - Coordinator
    
    func start() {
        let viewController = CharactersViewController(apiClient: environment.apiClient)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    
}
