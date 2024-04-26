//
//  RegisterModel.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 23/04/2024.
//

import Foundation

class LoginModel {
    static let shared = LoginModel()
    var isAdmin: Bool = false
    
    private init() {}
    
    func handleLoginResponse(_ response: LoginResponse) {
        LoginModel.shared.isAdmin = response.isAdmin
    }
}
