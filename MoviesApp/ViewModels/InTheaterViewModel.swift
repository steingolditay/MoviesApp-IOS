//
//  InTheaterViewModel.swift
//  MoviesApp
//
//  Created by Itay Steingold on 17/05/2021.
//

import Foundation

class MoviesInTheaterViewModel: ObservableObject {
    
    @Published var pageNumber = 1
    @Published var moviesList = [Movie]()
    @Published var maximumPages = 2
 
    init(){
        loadPage()
    }
    
    func updatePageNumber() -> Void {
        self.pageNumber += 1
    }
    
    func loadPage() -> Void {
        if pageNumber < maximumPages {
            guard let url = URL(string: Constants.apiInTheater+"\(self.pageNumber)") else {return}
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let result = try! JSONDecoder().decode(PopularResult.self, from: data!)
                DispatchQueue.main.async {
                    self.maximumPages = result.total_pages
                    self.moviesList += result.results
                    self.updatePageNumber()
                }
            }
            .resume()
        }
    }
}
