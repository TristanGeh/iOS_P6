//
//  CandidatesViewModel.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import Foundation

struct Candidate: Identifiable, Hashable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let email: String
    let phone: String?
    let linkedinURL: String?
    let note: String?
    let isFavorite: Bool
}
