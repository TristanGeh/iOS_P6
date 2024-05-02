//
//  RegisterViewModel.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 25/04/2024.
//

import Foundation
class RegisterViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isRegister = false
    @Published var errorMessage: String?
    
    private var apiUser = APIUser()
    
    func performRegister() {
        guard password == confirmPassword else {
            errorMessage = "Les mots de passe ne correspondent pas."
            print(errorMessage!)
            return
        }
        errorMessage = nil
        
        apiUser.register(email: email, password: password, firstName: firstName, lastName: lastName) { result in
            switch result {
            case .success(let isRegister):
                self.isRegister = isRegister
            case .failure(let error):
                print("Register failed avec error: \(error.localizedDescription)")
                self.isRegister = false
            }
        }
    }
}
