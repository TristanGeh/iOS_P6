//
//  CandidateLinkedInView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 27/03/2024.
//

import SwiftUI

struct CandidateLinkedInView: View {
    
    @ObservedObject var viewModel: CandidateDetailViewModel
    @State private var isEditingDetail = false
    @State private var linkedinUrl: String?
    
    var candidate: Candidate
    
    var body: some View {
        HStack(spacing: 32) {
            if isEditingDetail {
                TextField("LinkedIn", text: $viewModel.linkedinUrl)
            }
            Text("LinkedIn")
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

