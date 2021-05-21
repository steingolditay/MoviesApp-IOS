//
//  MovieView.swift
//  MoviesApp
//
//  Created by Itay Steingold on 17/05/2021.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    
    let movieId: Int
    @State var movie = MovieDetails()
    @State var isFavorite = false
    @State var viewModel: MovieDetailsViewModel
    @State var isLoading = true
    
    init(movie_id: Int) {
        self.movieId = movie_id
        self.viewModel = MovieDetailsViewModel(movieId: movieId)

    }
    
    var body: some View {
        ScrollView {
            if isLoading {
                LoadingProgressBar()
            }
            VStack{
                if (movie.id != nil){
                    let imageUrl = (movie.backdrop_path != nil) ? Constants.imagePrefixUrlHD + movie.backdrop_path! : ""
                    let url = URL(string: imageUrl)
                    ZStack {
                        KFImage.url(url)
                            .placeholder {Image(systemName: "film")
                                .foregroundColor(Color.red)
                            }
                            .resizable()
                            .scaledToFill()
                        
                        VStack {
                            Spacer()
                            HStack {
                                MovieLayoutText(text: movie.title!)
                                Spacer()
                            }
                        }
                    }
                    // detials
                    VStack {
                        Text(movie.overview!)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 0, trailing: 4))
                        Detail(title: "Popularity:", value: String(format: "%.2f", movie.popularity!))
                        Detail(title: "Release Date:", value: movie.release_date!)
                        Detail(title: "Langauge:", value: movie.original_language!)
                        Detail(title: "Genres:", value: String(movie.genres!.count))
                    }

                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        .onTapGesture {
                            if (isFavorite){
                                self.isFavorite = FavoritesRepository.shared.removeFromFavorites(movieId: movie.id!)
                            }
                            else {
                                self.isFavorite = FavoritesRepository.shared.addToFavorites(movieDetails: movie)

                            }
                            
                        }
                        .foregroundColor(isFavorite ? .yellow : .black)
                }
                Spacer()
            }
            .onAppear(){
                viewModel.loadPage(completion: { result in
                    isLoading = false
                    self.movie = result
                    isFavorite = FavoritesRepository.shared.checkIfFavorite(movieId: movieId)
                })

            }
        }
    }
}



struct Detail: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .bold()
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8))
            Text(value)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 8))
            Spacer()
        }
        
    }
}



struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie_id: 11111)
    }
}
