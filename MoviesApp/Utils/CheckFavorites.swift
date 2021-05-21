//
//  CheckFavorites.swift
//  MoviesApp
//
//  Created by Itay Steingold on 18/05/2021.
//

import Foundation


struct CheckInFavorite {
    
    let userDefaults = UserDefaults.standard
    
    func checkIfFavorite(movieId: Int) -> Bool {
        let decoder = JSONDecoder()

        do {
            if let storedData = userDefaults.data(forKey: String(movieId)) {
                let newArray =  try decoder.decode(MovieDetails.self, from: storedData)
                if (newArray.id! == movieId){
                    return true
                }
            }
            else {
                return false
            }
        }
        catch {
            print(error)
        }
        return false
    }
    
    func removeFromFavorites(movieId: Int) -> Bool {
        if (checkIfFavorite(movieId: movieId)){
            userDefaults.removeObject(forKey: String(movieId))
            return false
        }
    
        return true
    }
    
    func addToFavorites(movieDetails: MovieDetails) -> Bool {
        if (!checkIfFavorite(movieId: movieDetails.id!)){
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(movieDetails){
                UserDefaults.standard.set(encoded, forKey: String(movieDetails.id!))
            }
            
            return true
            
        }
        else {
            return false
        }

    }
}
