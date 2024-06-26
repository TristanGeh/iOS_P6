//
//  CandidateTileView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 31/03/2024.
//

import SwiftUI

struct CandidateTileView: View {
    var candidate: Candidate
    var isEditing: Bool
    var onDelete: () -> Void
    
    @StateObject var viewModel = CandidatesViewModel()
    @State private var candidateDetail: CandidateDetail?
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationLink(
            destination: CandidateDetailView(viewModel: CandidateDetailViewModel(candidateId: candidate.id)),
            isActive: $isActive
        ) {
            HStack {
                VStack(alignment: .leading) {
                    Text(candidate.firstName)
                        .padding(.horizontal, 20)
                        .foregroundColor(.black)
                    
                    Text(candidate.lastName)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
                
                if candidate.isFavorite {
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.yellow)
                        .padding(.horizontal, 20)
                }
                
                if isEditing {
                    Button(action: onDelete) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .padding(.trailing, 20)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.white)
            .cornerRadius(8.0)
            .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 5, y: 6)
        }
        .onTapGesture {
            isActive = true
            viewModel.loadCandidateDetail(candidateId: candidate.id)
        }
    }
}

#Preview {
    CandidateTileView(candidate: Candidate(id: UUID(uuidString: "5662b03a-820e-4428-a301-8ac4da8ed0ae")!, firstName: "Jean-Pierre", lastName: "Potiron", email: "jeanpierre@example.com", phone: "0123456789", linkedinURL: "https://www.linkedin.com/in/jeanpierre", note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", isFavorite: true), isEditing: false, onDelete: {})
}

