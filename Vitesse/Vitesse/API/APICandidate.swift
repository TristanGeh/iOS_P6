//
//  APICandidate.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 23/04/2024.
//

import Foundation

import Foundation

class APICandidate {
    
    // MARK: - Fetch Candidate
    
    func fetchCandidates(completion: @escaping (Result <[Candidate], Error>) -> Void) {
        let headers = [
            "Content-Type": "application/json"
        ]
        
        APIService.shared.createRequest(method: .get, endPoint: .candidate(.base), headers: headers, includeToken: true) { result in
            switch result {
            case .success(let data):
                print("Données brutes reçues: \(String(data: data, encoding: .utf8) ?? "Données non lisibles")")

                do {
                    let candidates = try JSONDecoder().decode([Candidate].self, from: data)
                    print("Réussite de la récupération des candidats: \(candidates.count) candidats reçus.")

                    completion(.success(candidates))
                } catch {
                    print("Erreur de décodage des candidats: \(error)")

                    completion(.failure(error))
                }
            case .failure(let error):
                print("Échec de la récupération des candidats: \(error.localizedDescription)")

                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Fetch Candidate Details
    
    func fetchCandidateDetails(candidateId: String, completion: @escaping (Result <CandidateDetail, Error>) -> Void)
    {
        let headers = [
            "Content-Type": "application/json"
        ]
        APIService.shared.createRequest(method: .get, endPoint: .candidate(.detail(candidateId)), headers: headers, includeToken: true) { result in
            switch result {
            case .success(let data):
                do {
                    let candidate = try JSONDecoder().decode(CandidateDetail.self, from: data)
                    completion(.success(candidate))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Create Candidate
    
    func createCandidate(email: String, note: String?, linkedinUrl: String?, firstName: String, lastName: String, phone: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        
        let headers = ["Content-type": "application/json"]
        var body: [String: Any] = [
                "email": email,
                "firstName": firstName,
                "lastName": lastName,
                "phone": phone
            ]
            
            body["note"] = note ?? NSNull()
            body["linkedinURL"] = linkedinUrl ?? NSNull()

        
        APIService.shared.createRequest(method: .post, endPoint: .candidate(.base), headers: headers, includeToken: true, body: body as [String : Any]) { result in
            switch result {
            case .success(_):
                //self.fetchCandidate()
                return
                //print("Candidats chargés avec succès: \(candidates.count) candidats récupérés.")
            case .failure(let error):
                print("Erreur lors de la création du candidat: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Update Candidate
    
    func updateCandidate(candidateId: String, email: String, note: String?, linkedinUrl: String?, firstName: String, lastName: String, phone: String, completion: @escaping (Result<CandidateDetail, Error>) -> Void) {
        
        let headers = ["Content-Type": "application/json"]
        var body: [String: Any] = [
                "email": email,
                "firstName": firstName,
                "lastName": lastName,
                "phone": phone
            ]
            
            body["note"] = note ?? NSNull()
            body["linkedinURL"] = linkedinUrl ?? NSNull()

        
        APIService.shared.createRequest(method: .put, endPoint: .candidate(.detail(candidateId)), headers: headers, includeToken: true, body: body) { result in
            switch result {
                    case .success(let data):
                        do {
                            let updatedCandidate = try JSONDecoder().decode(CandidateDetail.self, from: data)
                            print("Candidat mis à jour avec succès: \(updatedCandidate)")
                            completion(.success(updatedCandidate))
                        } catch {
                            print("Erreur lors de la décodage de la réponse: \(error)")
                            completion(.failure(error))
                        }
                    case .failure(let error):
                        print("Erreur lors de la mise à jour du candidat: \(error.localizedDescription)")
                        completion(.failure(error))
                    }
        }
    }
    
    // MARK: - Delete Candidate
    
    func deleteCandidate(candidateId: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let headers = ["Content-Type": "application/json"]

        APIService.shared.createRequest(method: .delete, endPoint: .candidate(.detail(candidateId)), headers: headers, includeToken: true, body: nil) { result in
            switch result {
            case .success(_):
                print("Candidat supprimé avec succès.")
                completion(.success(()))
            case .failure(let error):
                print("Erreur lors de la suppression du candidat: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Handle Favorite Status

    func handleFavoriteStatus(candidateId: String, completion: @escaping (Result<Candidate, Error>) -> Void) {
        let headers = ["Content-Type": "application/json"]

        APIService.shared.createRequest(method: .post, endPoint: .candidate(.favorite(candidateId)), headers: headers, includeToken: true, body: nil) { result in
            switch result {
            case .success(let data):
                do {
                    let updatedFavorite = try JSONDecoder().decode(Candidate.self, from: data)
                    print("Candidat mis à jour avec succès: \(updatedFavorite)")
                    completion(.success(updatedFavorite))
                } catch {
                    print("Erreur lors de la décodage du candidat: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("Erreur lors de la mise à jour du statut de favori: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }


}

