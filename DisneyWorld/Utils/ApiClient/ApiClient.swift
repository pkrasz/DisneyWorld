//
//  ApiClient.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import Foundation
import UIKit

protocol ApiClientType: AnyObject {
    func getData<Object: Decodable>(endpoint: String?, as type: Object.Type, completion: @escaping (Object?, String?) -> Void)
    
    func getImage(for url: URL, completion: @escaping (UIImage?) -> Void)
}

final class ApiClient: ApiClientType {
    
    // MARK: - Properties
    
    private let session: URLSession = .shared
    private let baseUrl: String = "https://api.disneyapi.dev/characters"

    
    // MARK: - Methods
    
    func getData<Object: Decodable>(endpoint: String?, as type: Object.Type, completion: @escaping (Object?, String?) -> Void) {
      
        var url = URL(string: baseUrl)
        if let endpoint = endpoint {
            let slashEndpoint = "/\(endpoint)"
            url = URL(string: baseUrl + slashEndpoint)
        }
        guard let url = url else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let object = try? decoder.decode(Object.self, from: data) {
                    completion(object, nil)
                }
            }
            if let error = error {
                completion(nil,error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getImage(for url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = session.dataTask(with: url) { data, _, _ in
            if let data = data {
                let image = UIImage(data: data)
                completion(image)
            }
        }
        task.resume()
    }
}
