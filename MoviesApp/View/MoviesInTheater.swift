//
//  MoviesInTheater.swift
//  MoviesApp
//
//  Created by Itay Steingold on 17/05/2021.
//

import Kingfisher
import SwiftUI

struct MoviesInTheater: View {
    
    @ObservedObject var viewModel = MoviesInTheaterViewModel()
    var title: String
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns:
                        [GridItem(.flexible(minimum: 100, maximum: 300), spacing: 16, alignment: .top),
                        GridItem(.flexible(minimum: 100, maximum: 300), spacing: 16, alignment: .top)],
                    content: {
                        ForEach(viewModel.moviesList, id: \.uuid){ movie in
                            MovieGridLayout(movie: movie)
                        }
                    }
                )
                Button("See More"){
                    viewModel.loadPage()
                }.padding()
                
            }.padding()
            .navigationTitle(title)
        }
    }
}

//

struct MoviesInTheater_Previews: PreviewProvider {
    static var previews: some View {
        PupularMovies(title: "Title")
    }
}
