//
//  CandidatesViewModel.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import Foundation

class CandidatesViewModel: ObservableObject {
    @Published var candidates = [Candidate]()
    @Published var detailedCandidate: CandidateDetail?
    
    @Published var searchText: String = ""
    @Published var showFavorites: Bool = false
    @Published var isEditing: Bool = false
    
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
    
    func deleteCandidate(candidateId: UUID) {
        let candidateIdString = candidateId.uuidString
        apiCandidate.deleteCandidate(candidateId: candidateIdString) { [weak self] result in
            switch result {
            case .success():
                self?.candidates.removeAll { $0.id == candidateId }
                print("Candidat supprimé avec succès")
            case .failure(let error):
                print("Erreur lors de la suppression du candidat: \(error)")
            }
        }
    }
    
    func loadCandidateDetail(candidateId: UUID) {
        let candidateIdString = candidateId.uuidString
        apiCandidate.fetchCandidateDetails(candidateId: candidateIdString) { result in
            switch result {
            case .success(_):
                print("Candidat chargé avec succés")
            case .failure(let error):
                print("Erreur du chargement d'un candidat:\(error)")
            }
        }
    }
}


