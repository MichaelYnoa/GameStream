//
//  GamesView.swift
//  GameStream
//
//  Created by Michael Araujo on 2023-03-02.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hola desde pantalla GamesView")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                
                perform: {
                    
                    print("Primer elemento del json")
                    
                    print("Titulo del primer videojuego del json")
                    
                }
            
                
            
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}