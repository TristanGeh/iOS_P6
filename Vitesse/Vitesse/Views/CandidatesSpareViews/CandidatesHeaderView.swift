//
//  CandidatesHeaderView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct CandidatesHeaderView: View {
    var body: some View {
        HStack{
            EditButton()
            Spacer()
            Text("Candidats")
                .font(.title2)
            Spacer()
            Image(systemName: "star")
            
        }
        .padding()
    }
}

#Preview {
    CandidatesHeaderView()
}
