//
//  NetworkManager.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 03/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://multitudes.github.io/images/test.json"
    let cache = NSCache<NSString, UIImage>()
    
    
    private init() {}
    
    func getCoffee(for coffeeName: String, completed: @escaping (Result<[Avatar], CFErrorMessage>) -> Void) {
        let endpoint = baseURL + ""
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidResponse))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidDataReceived) )
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let avatars = try decoder.decode([Avatar].self, from: data)
                completed(.success(avatars))
            }  catch let DecodingError.keyNotFound(type, context) {
                           print("Type '\(type)' mismatch:", context.debugDescription)
                           print("codingPath:", context.codingPath)
                completed(.failure(.invalidJSONField))
            } catch let DecodingError.typeMismatch(type, context) {
                           print("Type '\(type)' mismatch:", context.debugDescription)
                           print("codingPath:", context.codingPath)
                completed(.failure(.invalidJSONValueType))
            } catch {
                completed(.failure(.invalidDataReceived))
            }
        }
        
        task.resume()
    }
}
