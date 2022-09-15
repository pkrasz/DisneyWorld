//
//  CharactersViewController.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    //MARK: - Properties
    
    private let apiClient: ApiClientType
    weak var coordinator: CharactersCoordinatorInputs?
    
    let tableViewIdentifier = "UITableViewCell"
    var charactersArr: [Character] = [] {
        didSet {
            DispatchQueue.main.async {
                self.contentView.charactersTableView.reloadData()
            }
        }
    }

    var contentView: CharactersView {
        return view as! CharactersView
    }
    
    //MARK: - Initializator
    
    init(apiClient: ApiClientType) {
        self.apiClient = apiClient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = CharactersView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupBindings()
    }
    
    //MARK: - Setup
    
    private func setupView() {
        
        contentView.charactersTableView.dataSource = self
        contentView.charactersTableView.delegate = self
        contentView.charactersTableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewIdentifier)
    }
    
    private func setupBindings() {
        
        apiClient.getData(endpoint: nil, as: CharcterData.self) { [weak self] data, error in
            if let data = data {
                self?.charactersArr = data.data
            }
            if let error = error {
                print("Error: \(error)")
            }
        }
    }
}

    //MARK: - Extension

extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier, for: indexPath)
        let character = charactersArr[indexPath.row]
        cell.textLabel?.text = character.name
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .darkGray.withAlphaComponent(0.5)
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .white.withAlphaComponent(0.3)
        cell.selectedBackgroundView = bgColorView
        
        let image = UIImage(systemName: "chevron.right")
        let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!))
        accessory.image = image
        accessory.tintColor = .white.withAlphaComponent(0.3)
        cell.accessoryView = accessory
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = charactersArr[indexPath.row]
        coordinator?.coordinateToDetails(with: character)
    }
}
