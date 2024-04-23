//
//  CandidateTileView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 31/03/2024.
//

import SwiftUI

struct CandidateTileView: View {
    var candidate: Candidate
    
    var body: some View {
        NavigationLink(value: candidate) {
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
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.white)
            .cornerRadius(8.0)
            .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 5, y: 6)
        }
        .navigationDestination(for: Candidate.self) { candidate in
            CandidateDetailView(candidate: candidate)
        }
    }
}

#Preview {
    CandidateTileView(candidate: Candidate(id: UUID(uuidString: "5662b03a-820e-4428-a301-8ac4da8ed0ae")!, firstName: "Jean-Pierre", lastName: "Potiron", email: "jeanpierre@example.com", phone: "0123456789", linkedinURL: "https://www.linkedin.com/in/jeanpierre", note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", isFavorite: true))
}

