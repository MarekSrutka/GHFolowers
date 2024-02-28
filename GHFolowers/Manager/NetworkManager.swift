//
//  NetworkManager.swift
//  GHFolowers
//
//  Created by Marek Srutka on 28.02.2024.
//

import Foundation

class NetworkManager {
    static let share = NetworkManager()
    
    let baseUrl: String = "https://api.github.com"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + "/users" + "/\(username)/followers?per_page=100&page-\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalitUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unabledToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
