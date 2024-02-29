//
//  PersistanceManager.swift
//  GHFolowers
//
//  Created by Marek Srutka on 29.02.2024.
//

import Foundation

// MARK: - PersistanceActionType

enum PersistanceActionType {
    case add, remove
}

// MARK: - PersistanceManager

enum PersistanceManager {
    
    // MARK: - Properties
    
    static private let defaults = UserDefaults.standard
    
    // MARK: - Keys
    
    enum Keys {
        static let favourites = "favorites"
    }
    
    // MARK: - Public Methods
    
    static func updateWith(favorite: Follower, actionType: PersistanceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    retrievedFavorites.append(favorite)
                    
                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: retrievedFavorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favourites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.setValue(encodedFavorites, forKey: Keys.favourites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
