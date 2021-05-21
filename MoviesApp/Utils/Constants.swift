//
//  Constants.swift
//  MoviesApp
//
//  Created by Itay Steingold on 15/05/2021.
//

import Foundation

struct Constants {
    // titles
    static let popular = "Popular"
    static let inTheater = "In Theater"
    static let favorites = "Favorites"
    
    // api
    static let apiKey = "2c46288716a18fb7aadcc2a801f3fc6b"
    static let apiPopular = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&page="
    static let apiInTheater = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&page="
    static let apiMovieDetails = "https://api.themoviedb.org/3/movie/"
    static let imagePrefixUrl = "https://image.tmdb.org/t/p/w342"
    static let imagePrefixUrlHD = "https://image.tmdb.org/t/p/w780"

    
}


 
