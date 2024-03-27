//
//  CandidateLinkedInView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 27/03/2024.
//

import SwiftUI

struct CandidateLinkedInView: View {
    var candidate: Candidate
    
    var body: some View {
        HStack(spacing: 8) {
            Text("LinkedIn")
            Spacer()
            if let linkedinURL = candidate.linkedinURL, let url = URL(string: linkedinURL){
                Link("Go on LinkedIn",destination: url)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color("SignIn"))
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    CandidateLinkedInView(candidate: Candidate(id: UUID(uuidString: "5662b03a-820e-4428-a301-8ac4da8ed0ae")!, firstName: "Jean-Pierre", lastName: "P", email: "jeanpierre@example.com", phone: "0123456789", linkedinURL: "https://www.linkedin.com/in/jeanpierre", note: "Très motivé", isFavorite: true))
}
