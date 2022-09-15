//
//  CharacterDetailsCoordinator.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import UIKit

class CharacterDetailsCoordinator: Coordinator {
    
    //MARK: - Properties
    
    private let navigationController: UINavigationController
    private let environment: CharacterDetailsEnvironment
    private let character: Character
    
    //MARK: - Initializator
    
    init(navigationController: UINavigationController, environment: CharacterDetailsEnvironment, character: Character) {
        self.navigationController = navigationController
        self.environment = environment
        self.character = character
    }
    
    //MARK: - Coordinator
    
    func start() {
        let viewController = CharacterDetailsViewController(apiClient: environment.apiClient, character: character)
        navigationController.pushViewController(viewController, animated: true)
    }
}
