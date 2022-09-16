//
//  OzelImage.swift
//  swiftUI-FilmArama
//
//  Created by Mert AKBAŞ on 16.09.2022.
//

import SwiftUI

struct OzelImage: View {
    
    let url : String
    init(url : String){
        self.url = url
        self.imageDownloaderClient.gorelIndir(url: self.url)
    }
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    var body: some View {
        if let data = self.imageDownloaderClient.indirilengorsel {
            return Image(uiImage: UIImage(data: data)!).resizable()
        }else {
            return Image("placeholder").resizable()
        }
    }
}

struct OzelImage_Previews: PreviewProvider {
    static var previews: some View {
        OzelImage(url: "https://www.akbashtour.com/wp-content/uploads/2022/01/Logo24.png")
    }
}
