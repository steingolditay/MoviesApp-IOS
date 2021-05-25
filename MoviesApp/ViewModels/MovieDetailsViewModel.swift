//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Itay Steingold on 17/05/2021.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    
    @Published var movieGenres = ""
    let movieId: Int
 
    init(movieId: Int){
        self.movieId = movieId
    }
    
    func loadPage(completion: @escaping (MovieDetails) -> ()) {
        guard let url = URL(string: Constants.apiMovieDetails + String(movieId) + "?api_key=" + Constants.apiKey) else {return}

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let result = try! JSONDecoder().decode(MovieDetails.self, from: data!)
            var genreList = [String]()
            
            for genre in result.genres! {
                genreList.append(genre.name)
            }
            self.movieGenres = genreList.joined(separator: ", ")
            
            DispatchQueue.main.async {
                completion(result)
            }
        }
        .resume()
        
    }
}
