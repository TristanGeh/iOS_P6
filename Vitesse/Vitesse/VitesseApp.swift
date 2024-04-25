//
//  VitesseApp.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 20/03/2024.
//

import SwiftUI

@main
struct VitesseApp: App {
    @StateObject var loginVM = LoginViewModel()  

        var body: some Scene {
            WindowGroup {
                if loginVM.isLoggedIn {
                    CandidatesView()
                } else {
                    LoginView(viewmodel: loginVM)
                }
            }
        }
}
