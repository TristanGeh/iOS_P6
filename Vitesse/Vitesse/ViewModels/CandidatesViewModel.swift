//
//  CandidatesViewModel.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import Foundation

class CandidatesViewModel: ObservableObject {
    @Published var candidates = [Candidate]()
    @Published var searchText = ""
    @Published var showFavorites = false
    
    private var apiCandidate = APICandidate()

    
    var searchResults: [Candidate] {
        candidates.filter { candidate in
            (searchText.isEmpty || "\(candidate.firstName) \(candidate.lastName)".localizedCaseInsensitiveContains(searchText)) &&
            (!showFavorites || candidate.isFavorite)
        }
    }

    func loadCandidates() {
            apiCandidate.fetchCandidates { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let fetchedCandidates):
                        self?.candidates = fetchedCandidates
                    case .failure(let error):
                        print("Error loading candidates: \(error)")
                    }
                }
            }
        }
}

