//
//  CandidateDetailView.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 21/03/2024.
//

import SwiftUI

struct CandidateDetailView: View {
    @ObservedObject var viewModel: CandidatesViewModel
    @State private var isEditingDetail = false
    @State private var firstName: String
    @State private var lastName: String
    @State private var email: String
    @State private var phone: String?
    @State private var note: String?
    @State private var linkedinUrl: String?

        var candidate: Candidate
        
        init(candidate: Candidate) {
            _viewModel = ObservedObject(wrappedValue: CandidatesViewModel())
            self.candidate = candidate
            _firstName = State(initialValue: candidate.firstName)
            _lastName = State(initialValue: candidate.lastName)
            _email = State(initialValue: candidate.email)
            _phone = State(initialValue: candidate.phone)
            _note = State(initialValue: candidate.note)
            _linkedinUrl = State(initialValue: candidate.linkedinURL)
        }

    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 28){
            HStack {
                if isEditingDetail {
                    TextField("First Name", text: $firstName)
                        .padding(5)
                        .background(Color(white:0.95 ))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                        )
                    TextField("Last Name", text: $lastName)
                        .padding(5)
                        .background(Color(white:0.95 ))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                        )
                } else {
                    Text(candidate.firstName + " " + candidate.lastName)
                        .font(.title2)
                }
                Spacer()
                Button(action: {
                    viewModel.toggleFavorite(candidateId: viewModel.candidate.id)
                }) {
                    Image(systemName: viewModel.candidate.isFavorite ? "star.fill" : "star")
                }            }
            VStack(alignment:.leading, spacing: 12) {
                Text("Phone")
                if isEditingDetail {
                    TextField("Phone", text: Binding.nilCoalescing($phone, defaultValue: " "))
                        .padding(5)
                        .background(Color(white:0.95 ))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                        )
                }else {
                    Text("\(candidate.phone ?? "Not available")")
                }
            }
            VStack(alignment:.leading, spacing: 12){
                Text("Email")
                if isEditingDetail {
                    TextField("email", text: $email)
                        .padding(5)
                        .background(Color(white:0.95 ))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                        )
                }else {
                    Text("\(candidate.email)")
                }
                
            }
            HStack(spacing: 32) {
                Text("LinkedIn")
                if isEditingDetail {
                    TextField("LinkedIn", text: Binding.nilCoalescing($linkedinUrl, defaultValue: " "))
                        .padding(5)
                        .background(Color(white:0.95 ))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                        )
                } else {
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
            VStack(alignment:.leading, spacing: 12){
                Text("Note")
                VStack {
                   if isEditingDetail {
                        TextField("Note", text: Binding.nilCoalescing($note, defaultValue: " "))
                           .lineLimit(nil)
                           .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                           .padding(.horizontal,10)
                           .padding(.vertical, 12)
                    }else {
                        Text("\(candidate.note ?? "Not available")")
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
                            let updatedCandidate = Candidate(
                                id: candidate.id,
                                firstName: firstName,
                                lastName: lastName,
                                email: email,
                                phone: phone,
                                linkedinURL: linkedinUrl,
                                note: note,
                                isFavorite: candidate.isFavorite
                            )
                            viewModel.saveChanges(candidate: updatedCandidate)
                        }
                isEditingDetail.toggle()
            }
        }
        Spacer()
    }
}

struct CandidateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let candidate = Candidate(id: UUID(uuidString: "5662b03a-820e-4428-a301-8ac4da8ed0ae")!, firstName: "Jean-Pierre", lastName: "P", email: "jeanpierre@example.com", phone: "0123456789", linkedinURL: "https://www.linkedin.com/in/jeanpierre", note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isFavorite: true)
        
        CandidateDetailView( candidate: candidate)
    }
}

