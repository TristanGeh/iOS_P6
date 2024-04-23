//
//  CandidatesViewModel.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import Foundation

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

class CandidatesViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var showFavorites = false
    
    var searchResults: [Candidate] {
        candidates.filter { candidate in
            (searchText.isEmpty || "\(candidate.firstName) \(candidate.lastName)".localizedCaseInsensitiveContains(searchText)) &&
            (!showFavorites || candidate.isFavorite)
        }
    }
}

