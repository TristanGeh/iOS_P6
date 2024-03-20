//
//  LoginView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 20/03/2024.
//

import SwiftUI

struct LoginView: View {
    @State var username = ""
    @State var password = ""
    
    let gradientStart = Color(red: 1/255, green: 152/255, blue: 117/255)
    let gradientEnd = Color(red: 221/255, green: 221/255, blue: 221/255).opacity(0.0)
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [gradientStart, gradientEnd]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 50){
                Image("Logo")
                VStack(spacing: 25){
                    VStack{
                        TextField("Email/Username", text: $username)
                            .padding()
                            .background(Color.white)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .cornerRadius(10)
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.white)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal,40)
                    VStack(spacing: 10){
                        Button(action: {}, label: {
                            Text("Sign in")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("SignIn"))
                                .cornerRadius(8)
                        })
                        Button(action: {}, label: {
                            Text("Register")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("Register"))
                                .cornerRadius(8)
                        })
                    }
                    .padding(.horizontal, 100)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
