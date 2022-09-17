//
//  DetayView.swift
//  swiftUI-FilmArama
//
//  Created by Mert AKBAŞ on 17.09.2022.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId : String
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            
            
            HStack{
                Spacer()
                OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.3, alignment: .center)
                Spacer()
            }
        
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film Adı Gösterilecek").font(.title).foregroundColor(.red).padding()
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "FİLM PLOTU GÖSTERİLECEK (burası bosta bırakılabilir)").foregroundColor(.blue).padding()
            
            Text("Yönetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen gösterilecek")").padding()
            
            Text("Yazar: \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar gösterilecek")").padding()
            
            Text("Ödüller: \(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller gösterilecek")").padding()
            
            Text("Yıl: \(filmDetayViewModel.filmDetayi?.year ?? "Yıl gösterilecek")").padding()
            Spacer()
            
        }.onAppear(perform:{
            self.filmDetayViewModel.filmDetayiAl(imdbID: imdbId)
        })
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "Test")
    }
}
