//
//  FavoriteMovies.swift
//  MoviesApp
//
//  Created by Itay Steingold on 21/05/2021.
//

import SwiftUI

struct FavoriteMovies: View {
    
    let title: String
    let repo = FavoritesRepository.shared

    @State var list = FavoritesRepository.shared.list
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(
                    columns:
                        [GridItem(.flexible(minimum: 100, maximum: 300), spacing: 16, alignment: .top),
                        GridItem(.flexible(minimum: 100, maximum: 300), spacing: 16, alignment: .top)],
                    content: {
                        ForEach(list){ result in
                            let movieObject = Movie(id: result.id!, title: result.title!, popularity: result.popularity!, backdrop_path: result.backdrop_path!)
                            MovieGridLayout(movie: movieObject)
                        }
                    }
                )
                
                Text("\(list.count)")
                    .padding()
                
            }
            .padding()
            .navigationTitle(title)
        }
        .onAppear() {
            list = repo.getAllFavorites()
        }
    
    }
}

struct FavoriteMovies_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMovies(title: Constants.favorites)
    }
}
