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
                CandidatesHeaderView(isEditing: $viewModel.isEditing, showFavorites: $viewModel.showFavorites)
                CandidatesSearchBarView(searchText: $viewModel.searchText)
                ScrollView{
                    VStack(alignment: .leading) {
                        Text("Candidats :")
                        ForEach(viewModel.searchResults, id: \.id) { candidate in
                            CandidateTileView(candidate: candidate, isEditing: viewModel.isEditing) {
                                viewModel.deleteCandidate(candidateId: candidate.id)
                            }
                            .onTapGesture {
                                    viewModel.loadCandidateDetail(candidateId: candidate.id)
                                }
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
