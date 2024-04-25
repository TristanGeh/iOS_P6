//
//  RegisterView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    
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
                            TextField("First Name", text: $viewModel.firstName)
                                .padding()
                                .background(Color.white)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .cornerRadius(10)
                            TextField("Last Name", text: $viewModel.lastName)
                                .padding()
                                .background(Color.white)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .cornerRadius(10)
                        }
                        TextField("Email", text: $viewModel.email)
                            .padding()
                            .background(Color.white)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .cornerRadius(10)
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(Color.white)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .cornerRadius(10)
                        SecureField("Confirm Password", text: $viewModel.confirmPassword)
                            .padding()
                            .background(Color.white)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 30)
                    Button(action: {
                        viewModel.performRegister()
                    }, label: {
                        Text("Create")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("SignIn"))
                            .cornerRadius(8)
                    })
                    .navigationDestination(isPresented: $viewModel.isRegister){  LoginView(viewmodel: LoginViewModel())
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
