//
//  RegisterView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct RegisterView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    
    @State var showLogin = false
    
    let gradientStart = Color(red: 1/255, green: 152/255, blue: 117/255)
    let gradientEnd = Color(red: 221/255, green: 221/255, blue: 221/255).opacity(0.0)
    
    init() {
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [gradientStart, gradientEnd]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 40){
                    Text("Register").font(.largeTitle)
                    VStack(spacing: 10){
                        HStack {
                            TextField("First Name", text: $firstName)
                                .padding()
                                .background(Color.white)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .cornerRadius(10)
                            TextField("Last Name", text: $lastName)
                                .padding()
                                .background(Color.white)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .cornerRadius(10)
                        }
                        TextField("Email", text: $email)
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
                        SecureField("Confirm Password", text: $password)
                            .padding()
                            .background(Color.white)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 30)
                    Button(action: {
                        showLogin = true
                    }, label: {
                        Text("Create")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("SignIn"))
                            .cornerRadius(8)
                    })
                    .navigationDestination(isPresented: $showLogin){  LoginView()
                    }
                    .padding(.horizontal, 100)
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
