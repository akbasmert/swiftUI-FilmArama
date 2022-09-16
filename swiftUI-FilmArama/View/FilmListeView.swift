//
//  ContentView.swift
//  swiftUI-FilmArama
//
//  Created by Mert AKBAŞ on 13.09.2022.
//

import SwiftUI

struct FilmListeView: View {
    
   @ObservedObject var filmListeViewModel : FilmListeViewModel
     init(){
         self.filmListeViewModel = FilmListeViewModel()
         self.filmListeViewModel.filmAramasiYap(filmIsmi: "pulp")
    }
    
    var body: some View {
        List(filmListeViewModel.filmler, id: \.imdbId){
            film in Text(film.title)
        }
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
