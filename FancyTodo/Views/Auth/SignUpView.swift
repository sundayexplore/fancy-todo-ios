//
//  SignUpView.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/10/21.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    @State private var name: String = ""
    @State private var email: String  = ""
    @State private var password: String = ""
    @State private var focusable: [Bool] = [false, false, false]
    @State private var isSecureTextEntry: Bool = true
    
    func signUp() {
        let defaults = UserDefaults.standard
        
        AuthService().signUp(name: name, email: email, password: password) { result in
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
                        signUp()
                    }
                }
            }
        }
        .navigationTitle("Sign up")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(AuthViewModel())
    }
}
