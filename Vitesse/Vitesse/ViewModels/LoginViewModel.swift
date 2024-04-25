//
//  LoginViewModel.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 25/04/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn = false
    
    private var apiUser = APIUser()
    
    func performLogin() {
        apiUser.login(email: username, password: password) { result in
            switch result {
            case .success(let isLoggedIn):
                self.isLoggedIn = isLoggedIn
            case .failure(let error):
                print("Login failed with error: \(error.localizedDescription)")
                self.isLoggedIn = false
            }
        }
    }
}
