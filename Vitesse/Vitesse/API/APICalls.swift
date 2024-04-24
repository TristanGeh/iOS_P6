//
//  APICalls.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 11/04/2024.
//

import Foundation

struct LoginResponse: Codable {
    let  token: String
    let isAdmin: Bool
}
struct RegisterResponse : Codable {
    let statusCode: Int
}
struct Candidate: Identifiable, Hashable, Codable {
    let id: UUID
    let firstName: String
    let lastName: String
    let email: String
    let phone: String?
    let linkedinURL: String?
    let note: String?
    let isFavorite: Bool
}
struct CandidateDetail: Identifiable, Hashable, Codable {
    let id: UUID
    let firstName: String
    let lastName: String
    let email: String
    let phone: String?
    let linkedinURL: String?
    let note: String?
    let isFavorite: Bool
}

class APICalls {
    
    
}
