//
//  CheckFavorites.swift
//  MoviesApp
//
//  Created by Itay Steingold on 18/05/2021.
//

import Foundation


class FavoritesRepository: ObservableObject {
    static let shared = FavoritesRepository()
    
    let userDefaults = UserDefaults.standard
    let decoder = JSONDecoder()
    @Published var list = [MovieDetails]()
    
    private init(){}
    
    
    func getAllFavorites() -> [MovieDetails] {
        list.removeAll()
        for (_, value) in userDefaults.dictionaryRepresentation(){
            if let data = value as? Data {
                let movieObject =  try? decoder.decode(MovieDetails.self, from: data)
                if (movieObject != nil){
                    list.append(movieObject!)
                }
            }
        }
        return list
    }
    
    func checkIfFavorite(movieId: Int) -> Bool {

        do {
            if let storedMovie = userDefaults.data(forKey: String(movieId)) {
                let movieObject =  try decoder.decode(MovieDetails.self, from: storedMovie)
                if (movieObject.id! == movieId){
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
            list = FavoritesRepository.shared.getAllFavorites()
            
            return false
        }
    
        return true
    }
    
    func addToFavorites(movieDetails: MovieDetails) -> Bool {
        if (!checkIfFavorite(movieId: movieDetails.id!)){
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(movieDetails){
                UserDefaults.standard.set(encoded, forKey: String(movieDetails.id!))
                list = FavoritesRepository.shared.getAllFavorites()

            }
            
            return true
            
        }
        else {
            return false
        }

    }
}

extension String {
    static func pointer(_ object: AnyObject?) -> String {
        guard let object = object else { return "nil" }
        let opaque: UnsafeMutableRawPointer = Unmanaged.passUnretained(object).toOpaque()
        return String(describing: opaque)
    }
}
