//
//  CandidateDetailView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

import SwiftUI

struct CandidateDetailView: View {
    @ObservedObject var viewModel: CandidateDetailViewModel
    @State private var isEditingDetail = false
    
    init(viewModel: CandidateDetailViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 28){
            HStack {
                if isEditingDetail {
                    TextField("First Name", text: $viewModel.firstName)
                        .padding(5)
                        .background(Color(white:0.95 ))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    TextField("Last Name", text: $viewModel.lastName)
                        .padding(5)
                        .background(Color(white:0.95 ))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                } else {
                    Text(viewModel.firstName + " " + viewModel.lastName)
                        .font(.title2)
                }
                Spacer()
                Button(action: {
                    viewModel.toggleFavorite()
                }) {
                    Image(systemName: viewModel.isFavorite ? "star.fill" : "star")
                }
                .disabled(viewModel.isAdmin)
            }
            VStack(alignment:.leading, spacing: 12) {
                Text("Phone")
                if isEditingDetail {
                    TextField("Phone", text: $viewModel.phone)
                    
                        .padding(5)
                        .background(Color(white:0.95 ))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }else {
                    Text("\(viewModel.phone ?? "Not available")")
                }
            }
            VStack(alignment:.leading, spacing: 12){
                Text("Email")
                if isEditingDetail {
                    TextField("email", text: $viewModel.email)
                        .padding(5)
                        .background(Color(white:0.95 ))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }else {
                    Text("\(viewModel.email)")
                }
                
            }
            HStack(spacing: 32) {
                Text("LinkedIn")
                if isEditingDetail {
                    TextField("LinkedIn", text: $viewModel.linkedinUrl)
                        .padding(5)
                        .background(Color(white:0.95 ))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                } else {
                    if let url = URL(string: viewModel.linkedinUrl), UIApplication.shared.canOpenURL(url){
                        Link("Go on LinkedIn",destination: url)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color("SignIn"))
                            .cornerRadius(8)
                    }
                }
            }
            VStack(alignment:.leading, spacing: 12){
                Text("Note")
                VStack {
                    if isEditingDetail {
                        TextField("Note", text: $viewModel.note)
                            .lineLimit(nil)
                            .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal,10)
                            .padding(.vertical, 12)
                    }else {
                        Text("\(viewModel.note ?? "Not available")")
                            .lineLimit(nil)
                            .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal,10)
                            .padding(.vertical, 12)
                    }
                    
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 1)
                )
            }
        }
        .padding(.horizontal, 25)
        .toolbar{
            Button(isEditingDetail ? "Save" : "Edit") {
                if isEditingDetail {
                    viewModel.saveCandidate()
                }
                isEditingDetail.toggle()
            }
        }
        Spacer()
            .onAppear {
                viewModel.loadCandidateDetails()
            }
    }
}




