//
//  ContentView.swift
//  GameStream
//
//  Created by Michael Araujo on 2023-02-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            Spacer()
            
            Color(red: 19/255, green: 30/255, blue: 53/255).ignoresSafeArea()
            
            VStack{
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 60)
                
                InicioYRegistroView()
            }
            
        }
        
    }
}

struct InicioYRegistroView: View {
   
    @State var tipoInicioSesion = true
    
    var body: some View{
        
        VStack{
            HStack {
                
                Spacer()
                
                Button("INICIA SESION") {
                    tipoInicioSesion = true
                    print("Pantalla Inicio Sesion")
                }.foregroundColor(tipoInicioSesion ? .white : .gray).bold()
                
                Spacer()
                
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                    print("Pantalla de Registro")
                }.foregroundColor(tipoInicioSesion ? .gray : .white).bold()
                
                Spacer()
                
            }
        }
        
        Spacer(minLength: 42)
        
        if tipoInicioSesion == true {
            InicioSesionView()
        }else{
            RegistroView()
        }
        
        
        
    }
}

struct InicioSesionView:View {
    
    @State var correo = ""
    @State var contraseña = ""
    
    var body: some View{
        
        ScrollView {
            
            
            VStack (alignment: .leading) {
                
                
                Text("Correo Electrónico").foregroundColor(Color("Dark-cian"))
                
                ZStack(alignment: .leading) {
                    
                    if correo.isEmpty{
                        Text("ejemplo @ gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    TextField("", text: $correo)
                    
                }
                
                Divider().frame(width: 300, height: 1).background(Color("Dark-cian")).padding(.bottom)
                
                
                
                
                ZStack(alignment: .leading) {
                    
                    if contraseña.isEmpty{
                        Text("**********").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("", text: $contraseña)
                    
                }
                
                Divider().frame(width: 300, height: 1).background(Color("Dark-cian")).padding(.bottom)
                
                
            }.padding(.horizontal, 77)
            
            
            
            
        }
        
        
    }
}

struct RegistroView:View {
    var body: some View{
        
        VStack{
            Text("Vista de inicio de Registro")
        }.foregroundColor(.white)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        
        Image("pantalla1").resizable()
        
        
    }
}
