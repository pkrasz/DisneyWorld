//
//  BaseCoordinator.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import Foundation

class BaseCoordinator {
    
    //MARK: - Properties
    
    fileprivate(set) weak var parent: Coordinator?
    private var childrens: [Coordinator] = []
    
    //MARK: - Methods
    
    func add(child coordinator: Coordinator) {
        if !childrens.contains(where: { $0 === coordinator }) {
            childrens.append(coordinator)
        }
    }
    
    func remove(child coordinator: Coordinator) {
        if let index = childrens.firstIndex(where: { $0 === coordinator }) {
            childrens.remove(at: index)
        }
    }
}

    //MARK: - Extension

extension CoordinatorType where Self: BaseCoordinator {
    func coordinate(to coordinator: Coordinator) {
        add(child: coordinator)
        coordinator.parent = self
        coordinator.start()
    }
}
