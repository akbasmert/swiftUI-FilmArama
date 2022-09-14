//
//  FilmViewModel.swift
//  swiftUI-FilmArama
//
//  Created by Mert AKBAŞ on 14.09.2022.
//

import Foundation

class FilmListeViewModel : ObservableObject { // observableobject diyerek ve var filmlere @Published ekleyerek yayına açık hale getirdik.
    
   @Published var filmler = [Film]()
    let downLoaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi :  String){
        downLoaderClient.filmleriIndir(search:filmIsmi) { (sonuc) in
            switch sonuc {
            case.failure(let hata): print(hata)
            case.success(let filmDizisi):
                if let filmDizisi = filmDizisi{
                    self.filmler =  filmDizisi
                }
            }
        }
    }
}
