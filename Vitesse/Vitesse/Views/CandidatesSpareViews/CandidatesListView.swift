//
//  CandidatesListView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct CandidatesListView: View {
    @State var candidates = ["Jean-Pierre P", "Jean-Paul B", "Jean-Claude VD","Jean-Philippe P"]
    
    var body: some View {
        NavigationStack{
            List(candidates, id: \.self) { candidate in
                NavigationLink(candidate, value: candidate)
            }
            .navigationDestination(for: Candidate.self ){ candidate in
                CandidateDetailView()
            }
        }
    }
}

#Preview {
    CandidatesListView()
}
