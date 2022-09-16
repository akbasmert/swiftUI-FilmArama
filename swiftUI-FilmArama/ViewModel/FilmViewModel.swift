//
//  FilmViewModel.swift
//  swiftUI-FilmArama
//
//  Created by Mert AKBAŞ on 14.09.2022.
//

import Foundation

class FilmListeViewModel : ObservableObject { // observableobject diyerek ve var filmlere @Published ekleyerek yayına açık hale getirdik.
    
   @Published var filmler = [FilmViewModel]()
    let downLoaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi :  String){
        downLoaderClient.filmleriIndir(search:filmIsmi) { (sonuc) in
            switch sonuc {
            case.failure(let hata): print(hata)
            case.success(let filmDizisi):
                if let filmDizisi = filmDizisi{
                    DispatchQueue.main.async { // Dönüştürme işlemi async bir işlem olduğu için bu fonksiyonu içine aldık.
                        self.filmler =  filmDizisi.map(FilmViewModel.init) //.map diyerek filmDizisini FilmViewModel e dönüştürdük.
                    }
                  
                }
            }
        }
    }
}

struct FilmViewModel {
   
    let film : Film
    var title : String {
        film.title
    }
    var poster : String {
        film.poster
    }
    var year : String {
        film.year
    }
    var imdbId : String {
        film.imdbId
    }
}
