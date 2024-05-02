//
//  RegisterViewModel.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 25/04/2024.
//

import Foundation
class CandidateDetailViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var note: String = ""
    @Published var linkedinUrl: String = ""
    @Published var isFavorite: Bool = false
    
    @Published var errorMessage: String?
    private var apiCandidate = APICandidate()
    private var candidateId: UUID
    
    var isAdmin: Bool {
        LoginModel.shared.isAdmin
    }
    
    init(candidateId: UUID) {
        self.candidateId = candidateId
    }
    
    func loadCandidateDetails() {
        apiCandidate.fetchCandidateDetails(candidateId: candidateId.uuidString) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let candidate):
                    self?.updateCandidateDetails(from: candidate)
                case .failure(let error):
                    self?.errorMessage = "Failed to load candidate details: \(error.localizedDescription)"
                }
            }
        }
    }
    
    private func updateCandidateDetails(from candidate: CandidateDetail) {
        firstName = candidate.firstName
        lastName = candidate.lastName
        email = candidate.email
        phone = candidate.phone ?? ""
        note = candidate.note ?? ""
        linkedinUrl = candidate.linkedinURL ?? ""
        isFavorite = candidate.isFavorite
    }
    
    func saveCandidate() {
        apiCandidate.updateCandidate(candidateId: candidateId.uuidString,
                                     email: email, note: note,
                                     linkedinUrl: linkedinUrl,
                                     firstName: firstName,
                                     lastName: lastName,
                                     phone: phone) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    print("Update successful: \(success)")
                case .failure(let error):
                    self.errorMessage = "Error updating candidate: \(error.localizedDescription)"
                }
            }
        }
    }
    
    func toggleFavorite() {
        guard isAdmin else {
            print("Action non autorisée : L'utilisateur n'est pas administrateur")
            return
        }
        isFavorite.toggle()
        apiCandidate.handleFavoriteStatus(candidateId: candidateId.uuidString) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    print("Statut de favoris mis à jour: \(success)")
                case .failure(let error):
                    self.errorMessage = "Erreur lors de la mise à jour du statut de favori: \(error.localizedDescription)"
                }
            }
        }
    }
}

