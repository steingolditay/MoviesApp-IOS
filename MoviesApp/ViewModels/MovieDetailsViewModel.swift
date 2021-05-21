//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Itay Steingold on 17/05/2021.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    
    @Published var moviesDetails = MovieDetails()
    let movieId: Int
 
    init(movieId: Int){
        self.movieId = movieId
    }
    
    func loadPage(completion: @escaping (MovieDetails) -> ()) {
        guard let url = URL(string: Constants.apiMovieDetails + String(movieId) + "?api_key=" + Constants.apiKey) else {return}

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let result = try! JSONDecoder().decode(MovieDetails.self, from: data!)
                DispatchQueue.main.async {
                    completion(result)
            }
        }
        .resume()
        
    }
}
