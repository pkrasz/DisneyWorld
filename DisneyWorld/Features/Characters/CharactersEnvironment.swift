//
//  CharactersEnvironment.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import Foundation

struct CharactersEnvironment {
    let apiClient: ApiClientType
}

extension CharactersEnvironment {
    var characterDetailsEnvironment: CharacterDetailsEnvironment {
        CharacterDetailsEnvironment(apiClient: apiClient)
    }
}
