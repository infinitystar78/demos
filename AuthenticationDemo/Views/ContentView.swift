//
//  ContentView.swift
//  AuthenticationDemo
//
//  Created by M W on 10/11/2022.
//

import AuthenticationServices
import SwiftUI

struct ContentView: View {
    @State private var showHomeScreen = false
    @State private var showAlert = false

    var body: some View {
        VStack {
            HStack {
                Text("Sign in")
                    .font(.headline)
                Spacer()
            }

            Spacer()
            
            SignInWithAppleButton { request in
                request.requestedScopes = [.fullName, .email]
            } onCompletion: { result in
                switch result {
                case .success(_):
                    showHomeScreen.toggle()
                case .failure(_):
                    showAlert.toggle()
                }

            }.frame(width: 320, height: 60)
        }
        .padding()
        .sheet(isPresented:$showHomeScreen){
            HomeScreen()
        }
        
        .alert( "Error, Login incorrect",isPresented: $showAlert) {
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
