//
//  CoordinatorType.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import Foundation

protocol CoordinatorType {
    func start()
}

extension CoordinatorType where Self: BaseCoordinator {
    func finish() {
        parent?.remove(child: self)
    }
}
