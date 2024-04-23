//
//  APIUser.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 15/04/2024.
//

import Foundation

class APIUser {
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let parameters = ["email": email, "password": password]
        
        APIService.shared.createRequest(method: .post, endPoint: .user(.authentification), headers: ["Content-Type" : "application/json"], body: parameters) { result in
            switch result {
            case .success(let data):
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion(.success(loginResponse))
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
        
        APIService.shared.createRequest(method: .post, endPoint: .user(.register),headers: ["Content-Type" : "application/json"], body: parameters) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(RegisterResponse.self, from: data)
                    if response.statusCode == 201 {
                        completion(.success(true))
                    } else{
                        completion(.failure(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Enregistrement échoué avec code: \(response.statusCode)"])))

                    }
                } catch  {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
