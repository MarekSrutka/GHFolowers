//
//  ErrorMessage.swift
//  GHFolowers
//
//  Created by Marek Srutka on 28.02.2024.
//

import Foundation

enum GFError: String, Error {
    case invalitUsername = "This username created an invalid request. Please try again."
    case unabledToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "You've already favorited this user. You must REALLY like them!"
}
