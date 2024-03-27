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
        VStack{
            HStack {
                Text(candidate.firstName + " " + candidate.lastName)
                Image(systemName: candidate.isFavorite ? "star.fill" : "star")
            }
            HStack {
                Text("Phone")
                Text("\(candidate.phone ?? "Not available")")
            }
            HStack{
                Text("Email")
                Text("\(candidate.email)")
            }
            CandidateLinkedInView(candidate: candidate)
            VStack(alignment:.leading){
                Text("Note")
                Text("\(candidate.note ?? "Not available")")
                    .lineLimit(nil)
                    .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                    
                
            }
        }
    }
}

#Preview {
    CandidateDetailView(candidate: Candidate(id: UUID(uuidString: "5662b03a-820e-4428-a301-8ac4da8ed0ae")!, firstName: "Jean-Pierre", lastName: "P", email: "jeanpierre@example.com", phone: "0123456789", linkedinURL: "https://www.linkedin.com/in/jeanpierre", note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", isFavorite: true))
}
