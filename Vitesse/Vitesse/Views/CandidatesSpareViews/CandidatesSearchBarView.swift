//
//  CandidatesSearchBarView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct CandidatesSearchBarView: View {
   @State var search = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(7)
            TextField("Search", text: $search)
        }
        .border(Color.black, width: 2)
        .cornerRadius(6.0)
        .padding()
    }
}

#Preview {
    CandidatesSearchBarView()
}
