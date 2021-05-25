//
//  FavoriteMovies.swift
//  MoviesApp
//
//  Created by Itay Steingold on 21/05/2021.
//

import SwiftUI

struct FavoriteMovies: View {
    
    let title: String
    @ObservedObject var repo = FavoritesRepository.shared
    @State var isShown = false
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(
                    columns:
                        [GridItem(.flexible(minimum: 100, maximum: 300), spacing: 16, alignment: .top),
                         GridItem(.flexible(minimum: 100, maximum: 300), spacing: 16, alignment: .top)],
                    content: {
                        ForEach(repo.list.sorted {$0.id! < $1.id!}){ result in
                            let movieObject = Movie(id: result.id!, title: result.title!, popularity: nil, backdrop_path: result.backdrop_path!)
                            MovieGridLayout(movie: movieObject)
                        }
                    }
                )
            }
            .padding()
            .navigationTitle(title)
        }
        .onAppear() {
            if !isShown {
                repo.getAllFavorites()
                isShown = true

            }
            
        }
    
    }
}

struct FavoriteMovies_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMovies(title: Constants.favorites)
    }
}
