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
                
                
                Text("Correo Electrónico").foregroundColor(Color("Dark-cian")).fontWeight(.bold)
                
                ZStack(alignment: .leading) {
                    
                    if correo.isEmpty{
                        Text("ejemplo @ejemplo.com").font(.caption)
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $correo).foregroundColor(.white)
                    
                }
                
                Divider().frame(width: 300, height: 1)
                    .background(Color("Dark-cian"))
                    .padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.white).bold()
                
                ZStack(alignment: .leading) {
                    
                    if contraseña.isEmpty{
                        Text("**********").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("", text: $contraseña).foregroundColor(.white)
                    
                }
                
                Divider().frame(width: 300, height: 1).background(Color("Dark-cian"))
                
                Button {
                    print("Olvidaste tu contraseñ")
                } label: {
                    Text("¿Olvidaste tu contraseña?").foregroundColor(Color("Dark-cian"))
                        .font(.footnote)
                        .frame(width: 300, alignment: .trailing)
                        .padding(.bottom)
                }

                
                
                
                Button(action: iniciarSesion) {
                    Text("INICIAR SESIÓN").fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("Dark-cian"), lineWidth: 3).shadow(color: .white, radius: 4))
                }
                
                Text("Inicia sesion con redes sociales").foregroundColor(.white).padding(.top, 50).frame(maxWidth: .infinity, alignment: .center).padding(.bottom)
                
                HStack{
                    
                    Button {
                        print("Iniciar Sesion con Facebook")
                    } label: {
                        Text("Facebook").foregroundColor(.white).bold()
                            .padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                            .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("Dark-cian"), lineWidth: 1))
                    }
                    
                    Divider()

                    Button {
                        print("Iniciar Sesion con Twitter")
                    } label: {
                        Text("Twitter").foregroundColor(.white).bold()
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("Dark-cian"), lineWidth: 1))
                    } //35,49,80
                    
                }.frame(maxWidth: .infinity)
                
                
            }.padding(.horizontal, 77)
            
            
            
            
        }
        
        
    }
}

func iniciarSesion() {
    print("estoy iniciando sesion")
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
