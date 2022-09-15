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
    private let character: Character
    
    var characterImage: UIImage?

    var contentView: CharacterDetailsView {
        return view as! CharacterDetailsView
    }
    
    //MARK: - Initializator
    
    init(apiClient: ApiClientType, character: Character) {
        self.apiClient = apiClient
        self.character = character
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
        let url = URL(string: character.imageUrl)
        guard let url = url else { return }
        
        apiClient.getImage(for: url) { [weak self] image in
            if let image = image {
                self?.characterImage = image
            }
        }

    }
}
