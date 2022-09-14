//
//  Film.swift
//  swiftUI-FilmArama
//
//  Created by Mert AKBAŞ on 13.09.2022.
//

import Foundation
struct Film : Codable {
    let title : String // buradaki isimler ile json dan gelen isim aynı olursa sıkıntı olur diye küçük harfle başlattık.
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodingKeys: String, CodingKey { //API den gelen JSON bilgisi ile struct taki değişlenleri eşledik.
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
        
    }
}

struct gelenFilmler : Codable { // Jsondan gelen bilgi Search yazısıyla geldiği için searctan geleni fimler dizisine atmak için yaptık.
    let filmler : [Film]
    private enum CodingKeys : String, CodingKey {
        case filmler = "Search"
    }
}
