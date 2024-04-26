//
//  CandidatesViewModel.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import Foundation

class CandidatesViewModel: ObservableObject {
    @Published var candidates = [Candidate]()
    @Published var detailedCandidate: Candidate?
    
    @Published var searchText: String = ""
    @Published var showFavorites: Bool = false
    @Published var isEditing: Bool = false
    
    var isAdmin: Bool {
        LoginModel.shared.isAdmin
    }
    
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
    
    func saveChanges(candidate: Candidate) {
        let candidateIdString = candidate.id.uuidString
        apiCandidate.updateCandidate(candidateId: candidateIdString,
                                     email: candidate.email,
                                     note: candidate.note ?? "",
                                     linkedinUrl: candidate.linkedinURL ?? "",
                                     firstName: candidate.firstName,
                                     lastName: candidate.lastName,
                                     phone: candidate.phone ?? "") { result in
            switch result {
            case .success(let success):
                print("Update successful: \(success)")
            case .failure(let error):
                print("Error updating candidate: \(error)")
            }
        }
    }
    
    func toggleFavorite(candidateId: UUID) {
        guard isAdmin else {
            print("Action non autorisée : L'utilisateur n'est pas administrateur")
            return
        }
        let candidateIdString = candidateId.uuidString
        apiCandidate.handleFavoriteStatus(candidateId: candidateIdString) { result in
            switch result {
            case .success():
                self.candidate.isFavorite.toggle()
                print("Statut de favori mis à jour avec succès.")
            case .failure(let error):
                print("Erreur lors de la mise à jour du statut de favori: \(error.localizedDescription)")
            }
        }

    }
}


