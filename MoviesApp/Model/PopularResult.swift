//
//  PopularResult.swift
//  MoviesApp
//
//  Created by Itay Steingold on 15/05/2021.
//

import Foundation

struct PopularResult: Codable, Identifiable {
    var id: Int {page}
    let page: Int
    let results: [Movie]
    let total_pages: Int
}

struct Movie: Codable, Identifiable {
    let uuid = UUID()
    let id: Int
    let title: String
    let popularity: Double?
    let backdrop_path: String?
    
}
