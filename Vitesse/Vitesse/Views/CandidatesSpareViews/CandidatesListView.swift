//
//  CandidatesListView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct CandidatesListView: View {
    
    var body: some View {
            List(candidates, id: \.id) { candidate in
                NavigationLink(candidate.firstName + " " + candidate.lastName, value: candidate)
            }
            .navigationDestination(for: Candidate.self ){ candidate in
                CandidateDetailView(candidate: candidate)
            }
        }
    }

#Preview {
    CandidatesListView()
}
