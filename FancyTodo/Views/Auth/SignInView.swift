//
//  SignIn.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var focusable: [Bool] = [false, false]
    @State private var isSecureTextEntry: Bool = true
    
    func signIn() {
        let defaults = UserDefaults.standard
        
        AuthService().signIn(email: email, password: password) { result in
            switch result {
            case .success(let data):
                defaults.setValue(data.act, forKey: "act")
                defaults.setValue(data.rft, forKey: "rft")
                authVM.user = data.user
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    CustomTextField(
                        label: "Email",
                        text: $email,
                        focusable: $focusable,
                        returnKeyType: .next,
                        tag: 0
                    )
                    .padding()
                    .frame(height: 48)
                    
                    CustomTextField (
                        label: "Password",
                        text: $password,
                        focusable: $focusable,
                        isSecureTextEntry: $isSecureTextEntry,
                        returnKeyType: .done,
                        tag: 1
                    )
                    .padding()
                    .frame(height: 48)
                    
                    Button("Continue") {
                        signIn()
                    }
                }
            }
        }
        .navigationTitle("Sign in")
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthViewModel())
    }
}

