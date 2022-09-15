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
    private var characterImage: UIImage? {
        didSet {
            DispatchQueue.main.async {
                self.setImage()
            }
        }
    }

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
        contentView.detailsView.nameLabel.text = character.name
        contentView.detailsView.filmsLabel.text = printArray(array: character.films)
        contentView.detailsView.shortFilmsLabel.text = printArray(array: character.shortFilms)
        contentView.detailsView.tvShowsLabel.text = printArray(array: character.tvShows)
        contentView.detailsView.videoGamesLabel.text = printArray(array: character.videoGames)
        contentView.detailsView.parkAttractionsLabel.text = printArray(array: character.parkAttractions)
        contentView.detailsView.alliesLabel.text = printArray(array: character.allies)
        contentView.detailsView.enemiesLabel.text = printArray(array: character.enemies)
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
    //MARK: - Methods
    
    func setImage() {
        contentView.characterImage.image = characterImage
    }
    
    func printArray(array: [String]) -> String {
        var text = ""
        if !array.isEmpty {
            for string in array {
                text += ", \(string)"
            }
        } else {
            text = "-/-"
        }
        
        return text
    }
}
