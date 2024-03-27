//
//  CandidatesView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct CandidatesView: View {
    var body: some View {
        NavigationStack{
            VStack{
                CandidatesHeaderView()
                CandidatesSearchBarView()
                CandidatesListView()
            }
            .background(Color.white)
        }
    }
}

#Preview {
    CandidatesView()
}
