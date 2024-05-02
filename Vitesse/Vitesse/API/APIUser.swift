//
//  APIUser.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 15/04/2024.
//

import Foundation

class APIUser {
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let parameters = ["email": email, "password": password]
        
        APIService.shared.createRequest(method: .post, endPoint: .user(.authentification), headers: ["Content-Type" : "application/json"], body: parameters) { result in
            switch result {
            case .success(let data):
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    APIService.shared.updateSession(token: loginResponse.token)
                    LoginModel.shared.handleLoginResponse(loginResponse)
                    print("Login succeeded with token: \(loginResponse.token), isAdmin: \(LoginModel.shared.isAdmin)")

                    completion(.success(true))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func register(email: String, password: String, firstName: String, lastName: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let parameters = ["email": email, "password": password, "firstName": firstName, "lastName": lastName]
        
        APIService.shared.createRequest(method: .post, endPoint: .user(.register), headers: ["Content-Type": "application/json"], body: parameters) { result in
            switch result {
            case .success(_):
                    completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
