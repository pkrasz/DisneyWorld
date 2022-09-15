//
//  CharacterDetailsViewController.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import UIKit

class CharacterDetailsViewController: UIViewController {

    //MARK: - Properties
    
    private let apiClient: ApiClientType
    private let characterID: Int
    

    var contentView: CharacterDetailsView {
        return view as! CharacterDetailsView
    }
    
    //MARK: - Initializator
    
    init(apiClient: ApiClientType, characterId: Int) {
        self.apiClient = apiClient
        self.characterID = characterId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = CharacterDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupBindings()
    }
    
    //MARK: - Setup
    
    private func setupView() {
    }
    
    private func setupBindings() {
        let characterIdString = String(characterID)
        apiClient.getData(endpoint: characterIdString, as: Character.self) { data, error in
            if let data = data {
                print("API CLIENT")
                print(data)
            }
            if let error = error {
                print("Error: \(error)")
            }
        }

    }
}
