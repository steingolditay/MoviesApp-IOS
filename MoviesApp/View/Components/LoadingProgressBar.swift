//
//  LoadingProgressBar.swift
//  MoviesApp
//
//  Created by Itay Steingold on 21/05/2021.
//

import SwiftUI

struct LoadingProgressBar: View {
    var body: some View {
        Text("Loading")
            .font(.title3)
        ProgressView()
            .scaleEffect(1)
    }
}

struct LoadingProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        LoadingProgressBar()
    }
}
