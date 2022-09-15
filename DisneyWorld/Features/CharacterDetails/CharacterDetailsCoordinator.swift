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
    private let characterId: Int
    
    //MARK: - Initializator
    
    init(navigationController: UINavigationController, environment: CharacterDetailsEnvironment, characterId: Int) {
        self.navigationController = navigationController
        self.environment = environment
        self.characterId = characterId
    }
    
    //MARK: - Coordinator
    
    func start() {
        let viewController = CharacterDetailsViewController(apiClient: environment.apiClient, characterId: characterId)
        navigationController.pushViewController(viewController, animated: true)
    }
}
