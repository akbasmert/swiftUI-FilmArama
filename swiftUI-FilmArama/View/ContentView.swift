//
//  ContentView.swift
//  swiftUI-FilmArama
//
//  Created by Mert AKBAŞ on 13.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button (action: {
            DownloaderClient().filmleriIndir(search:"titanic") {(sonuc) in switch sonuc {
        case.success(let filmDizisi): print(filmDizisi)
        case.failure(let hata): print(hata)
        }
            
            }
        }, label: {
            Text("Text yap")
        })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
