//
//  MovieLayout.swift
//  MoviesApp
//
//  Created by Itay Steingold on 17/05/2021.
//

import SwiftUI
import Kingfisher

struct MovieGridLayout: View {
    
    let movie: Movie
    
    var body: some View {
        
        let imageUrl = (movie.backdrop_path != nil) ? Constants.imagePrefixUrl + movie.backdrop_path! : ""
        let popularitry = (movie.popularity != nil) ? String(format: "%.2f", movie.popularity!) : ""
        let title = movie.title
        let url = URL(string: imageUrl)
        
        NavigationLink(destination: NavigationLazyView(MovieDetailsView(movie_id: movie.id))) {
            ZStack {
                KFImage.url(url).placeholder {
                    Image(systemName: "film").foregroundColor(Color.red)
                }
                .resizable()
                .scaledToFit()
                .cornerRadius(5)
                
                VStack {
                    HStack {
                        Spacer()
                        MovieLayoutText(text: popularitry)
                    }
                    Spacer()
                    HStack {
                        MovieLayoutText(text: title)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct MovieLayoutText: View {
    
    let text: String
    
    var body: some View{
        Text(text)
            .foregroundColor(Color.white)
            .bold()
            .lineLimit(1)
            .padding(2)
            .shadow(color: .black, radius: 5)
    }
}

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
