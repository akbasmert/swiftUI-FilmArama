//
//  ImageDownloaderClient.swift
//  swiftUI-FilmArama
//
//  Created by Mert AKBAŞ on 16.09.2022.
//

import Foundation

class ImageDownloaderClient: ObservableObject {
    
    @Published var indirilengorsel : Data?
    func gorelIndir(url : String){
        guard let imageUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.indirilengorsel = data
            }
            
        }.resume()
    }
}
