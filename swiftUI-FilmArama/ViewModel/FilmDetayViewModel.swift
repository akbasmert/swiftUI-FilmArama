//
//  FilmDetayViewModel.swift
//  swiftUI-FilmArama
//
//  Created by Mert AKBAŞ on 17.09.2022.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    @Published var filmDetayi : FilmDetaylariViewModel?
    
    let downLoaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbID:String){
        downLoaderClient.filmDetayiniIndir(imdbId: imdbID) { (sonuc) in
            switch sonuc {
            case .failure(let hata): print(hata)
            case.success(let filmDetay): DispatchQueue.main.async {
                self.filmDetayi = FilmDetaylariViewModel(detay: filmDetay)
            }
        }
    }
    
    }
    
}

struct FilmDetaylariViewModel{
    
    let detay: FilmDetay
    
    var title : String {
        detay.title
    }
    var poster:String{
        detay.poster
    }
    var year:String{
        detay.year
    }
    var imdbId:String{
        detay.imdbId
    }
    var director:String{
        detay.director
    }
    var writer:String{
        detay.writer
    }
    var awards:String{
        detay.awards
    }
    var plot:String{
        detay.plot
    }
}
