//
//  CandidatesHeaderView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct CandidatesHeaderView: View {
    @Binding var showFavorites: Bool
    
    var body: some View {
        HStack{
            EditButton()
            Spacer()
            Text("Candidats")
                .font(.title2)
            Spacer()
            
            Button(action: {
                showFavorites.toggle()
            }) {
                Image(systemName: showFavorites ? "star.fill" : "star")
                    .foregroundColor(showFavorites ? .yellow : .black)
            }
            
        }
        .padding()
    }
}
