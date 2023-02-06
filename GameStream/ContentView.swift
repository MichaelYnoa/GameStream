//
//  ContentView.swift
//  GameStream
//
//  Created by Michael Araujo on 2023-02-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Spacer()
                
                Color(red: 19/255, green: 30/255, blue: 53/255).ignoresSafeArea()
                
                VStack{
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 60)
                    
                    InicioYRegistroView()
                }
                
            }.navigationBarHidden(true)
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
    @State var isPantallaHomeActive = false
    
    var body: some View{
        
        ScrollView {
            
            
            VStack{
                
                
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
                    
                    Divider()
                    
                    Button {
                        print("Iniciar Sesion con Facebook")
                    } label: {
                        Text("Facebook").foregroundColor(.white).bold()
                            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                            .background(Color(.white).opacity(0.3)).cornerRadius(6)
                    }
                    
                    Divider()
                    
                    Button {
                        print("Iniciar Sesion con Twitter")
                    } label: {
                        Text("Twitter").foregroundColor(.white).bold()
                            .padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                            .background(Color(.white).opacity(0.3)).cornerRadius(6)
                    }
                    
                    Divider()
                    
                }.frame(maxWidth: .infinity)
                
                
            }.padding(.horizontal, 77)
            
            
            //NavigationLink(destination: Home(), isActive: $isPantallaHomeActive, label: EmptyView())
            
            NavigationLink(destination: Home(), isActive: $isPantallaHomeActive, label: { EmptyView() })
            
        }
        
        
    }
    
    
    func iniciarSesion() {
        print("estoy iniciando sesion")
        
        isPantallaHomeActive = true
    }
    
}



struct RegistroView:View {
    
    @State var correo = ""
    @State var contraseña = ""
    @State var confirmarContraseña = ""
    
    var body: some View{
        
        
        
        ScrollView {
            
            VStack(alignment: .center) {
                
                Text("Elije una foto de perfil").fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirla mas adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: tomarFoto, label: {
                    
                    ZStack{
                        Image("foto_perfil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                })
            }.padding(.bottom)
            
            
            
            
            VStack (alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text("Correo Electrónico*").foregroundColor(Color("Dark-cian")).fontWeight(.bold)
                    
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
                    
                    Text("Confirmar Contraseña").foregroundColor(.white).bold()
                    
                    ZStack(alignment: .leading) {
                        
                        if contraseña.isEmpty{
                            Text("**********").font(.caption).foregroundColor(.gray)
                        }
                        SecureField("", text: $confirmarContraseña).foregroundColor(.white)
                        
                    }
                    
                    Divider().frame(width: 300, height: 1).background(Color("Dark-cian"))
                    
                }
                
                
                Button(action: registrate) {
                    Text("REGISTRATE").fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("Dark-cian"), lineWidth: 3).shadow(color: .white, radius: 4))
                }
                
                Text("Registrate con redes sociales").foregroundColor(.white).padding(.top, 50).frame(maxWidth: .infinity, alignment: .center).padding(.bottom)
                
                HStack{
                    
                    Divider()
                    
                    Button {
                        print("Iniciar Sesion con Facebook")
                    } label: {
                        Text("Facebook").foregroundColor(.white).bold()
                            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                            .background(Color(.white).opacity(0.3)).cornerRadius(6)
                    }
                    
                    Divider()
                    
                    Button {
                        print("Iniciar Sesion con Twitter")
                    } label: {
                        Text("Twitter").foregroundColor(.white).bold()
                            .padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                            .background(Color(.white).opacity(0.3)).cornerRadius(6)
                    }
                    
                    Divider()
                    
                }.frame(maxWidth: .infinity)
                
                
            }.padding(.horizontal, 77)
            
            
            
            
            
            
        }
    }
    
    func tomarFoto() {
        print("Voy a tomar fotografia de perfil")
    }
    
    func registrate() {
        print("Te registraste")
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            
            ContentView()
            
            Image("pantalla2").resizable()
            
            
        }
    }
}
