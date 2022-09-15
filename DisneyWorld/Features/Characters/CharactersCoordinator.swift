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
    
    //MARK: - Initializator
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Coordinator
    
    func start() {
        let viewController = CharactersViewController()
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    
}
