//
//  CandidateDetailView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct CandidateDetailView: View {
    var candidate: Candidate
    
    var body: some View {
        VStack(alignment: .leading, spacing: 28){
            HStack {
                Text(candidate.firstName + " " + candidate.lastName)
                    .font(.title2)
                Spacer()
                Image(systemName: candidate.isFavorite ? "star.fill" : "star")
            }
            VStack(alignment:.leading, spacing: 12) {
                Text("Phone")
                Text("\(candidate.phone ?? "Not available")")
            }
            VStack(alignment:.leading, spacing: 12){
                Text("Email")
                Text("\(candidate.email)")
            }
            CandidateLinkedInView(candidate: candidate)
            VStack(alignment:.leading, spacing: 12){
                Text("Note")
                VStack {
                    Text("\(candidate.note ?? "Not available")")
                        .lineLimit(nil)
                        .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal,10)
                        .padding(.vertical, 12)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 1)
                )
            }
        }
        .padding(.horizontal, 25)
        .toolbar{
            EditButton()
        }
        Spacer()
    }
}

#Preview {
    CandidateDetailView(candidate: Candidate(id: UUID(uuidString: "5662b03a-820e-4428-a301-8ac4da8ed0ae")!, firstName: "Jean-Pierre", lastName: "P", email: "jeanpierre@example.com", phone: "0123456789", linkedinURL: "https://www.linkedin.com/in/jeanpierre", note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", isFavorite: true))
}
