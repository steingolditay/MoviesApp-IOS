//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Itay Steingold on 17/05/2021.
//

import Foundation


struct MovieDetails: Codable, Identifiable {
    let id: Int?
    let backdrop_path: String?
    let title: String?
    let overview: String?
    let popularity: Double?
    let release_date: String?
    let original_language: String?
    let genres: [Genre]?
    
    init(id: Int? = nil,
         backdrop_path: String? = nil,
         title: String? = nil,
         overview: String? = nil,
         popularity: Double? = nil,
         release_date: String? = nil,
         original_language: String? = nil,
         genres: Array<Genre>? = nil
         ){
        self.id = id
        self.backdrop_path = backdrop_path
        self.title = title
        self.overview = overview
        self.popularity = popularity
        self.release_date = release_date
        self.original_language = original_language
        self.genres = genres
        
    }

    
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}
