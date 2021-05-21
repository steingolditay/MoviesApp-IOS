//
//  ContentView.swift
//  MoviesApp
//
//  Created by Itay Steingold on 14/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PupularMovies(title: Constants.popular)
                .tabItem {
                    Image(systemName: "flame")
                    Text(Constants.popular)
                }
            
            MoviesInTheater(title: Constants.inTheater)
                .tabItem {
                    Image(systemName: "film")
                    Text(Constants.inTheater)
                }
            
            FavoriteMovies(title: Constants.favorites)
                .tabItem {
                    Image(systemName: "star")
                    Text(Constants.favorites)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }}

