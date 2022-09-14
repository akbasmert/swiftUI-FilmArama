//
//  DownloaderClient.swift
//  swiftUI-FilmArama
//
//  Created by Mert AKBAŞ on 13.09.2022.
//

import Foundation
import SwiftUI

class DownloaderClient { // escaping işlemi yaptık çünkü veri çekme işlemi uzun sürebilir veya hata olabilir.
   
    func filmleriIndir(search: String, completion: @escaping( Result<[Film]?,DownLoaderError>)-> Void){
        // guard let if let e benzer bir yapı ama return döndürüyor.
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=f5133d7") else {
            return completion(.failure(.yanlisUrl))// urlde hata varsa DownloadError dan yanlıs url yi verecek.
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(gelenFilmler.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(filmCevabi.filmler))

        }.resume()//resume demezsek bu işem başlamazzöçöcxvmlk
    }
    
    
}

enum DownLoaderError: Error { // Error hatası geldiğinde burası çalışacak.
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
    
}
