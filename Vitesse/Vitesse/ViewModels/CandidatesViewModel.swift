//
//  CandidatesViewModel.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import Foundation

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

