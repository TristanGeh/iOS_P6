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
    var firstName: String
    var lastName: String
    var email: String
    var phone: String?
    var linkedinURL: String?
    var note: String?
    var isFavorite: Bool
}
struct CandidateDetail: Identifiable, Hashable, Codable {
    let id: UUID
    var firstName: String
    var lastName: String
    var email: String
    var phone: String?
    var linkedinURL: String?
    var note: String?
    var isFavorite: Bool
}

class APICalls {
    
    
}
