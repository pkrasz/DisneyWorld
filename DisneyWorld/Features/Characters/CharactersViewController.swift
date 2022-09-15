//
//  CharactersViewController.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import UIKit

class CharactersViewController: UIViewController {
    
    //MARK: - Properties
    
    private let apiClient: ApiClientType
    
    //MARK: - Initializator
    
    init(apiClient: ApiClientType) {
        self.apiClient = apiClient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        apiClient.getData(endpoint: nil, as: CharcterData.self) { [weak self] data, error in
            if let data = data {
                print(data)
            }
            if let error = error {
                print("Error: \(error)")
            }
        }
    }
}
