//
//  ApiClient.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import Foundation

protocol ApiClientType: AnyObject {
    func getData<Object: Decodable>(endpoint: String?, as type: Object.Type, completion: @escaping (Object?, String?) -> Void)
}

final class ApiClient: ApiClientType {
    
    // MARK: - Properties
    
    private let session: URLSession = .shared
    private let baseUrl: String = "https://api.disneyapi.dev/characters"
    
    //MARK: Initializator
    
    private init() {}
    
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
}
