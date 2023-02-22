//
//  Home.swift
//  GameStream
//
//  Created by Michael Araujo on 2023-02-04.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        TabView{
            
            Text("Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }
            
            Text("Pantalla de juegos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }
            
            
            Text("Pantalla Home")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }
            
            Text("Pantalla Favoritos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }
            
            
        }
        
        
        Text("Pantalla Home")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
