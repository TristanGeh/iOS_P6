//
//  CandidatesView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct CandidatesView: View {
    @StateObject var viewModel = CandidatesViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                CandidatesHeaderView(showFavorites: $viewModel.showFavorites)
                CandidatesSearchBarView(searchText: $viewModel.searchText)
                ScrollView{
                    VStack(alignment: .leading) {
                        Text("Candidats :")
                        ForEach(viewModel.searchResults, id: \.id) { candidate in
                            CandidateTileView(candidate: candidate)
                                .padding(.vertical,8)
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                viewModel.loadCandidates()
            }
        }
    }
}

#Preview {
    CandidatesView()
}
