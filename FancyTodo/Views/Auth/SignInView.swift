//
//  SignIn.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var fieldFocus: [Bool] = [false, false]
    @State var isSecureTextEntry: Bool = true
    
    func signIn() {
        AuthService().signIn(email: email, password: password) { result in
            switch result {
                case .success(let act):
                    print(act)
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
    
    var body: some View {
        VStack {
                CustomTextField(
                    label: "Email",
                    text: $email,
                    focusable: $fieldFocus,
                    returnKeyType: .next,
                    tag: 0
                )
                .padding()
                .frame(height: 48)
                
                CustomTextField (
                    label: "Password",
                    text: $password,
                    focusable: $fieldFocus,
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
        .navigationTitle("Sign in")
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

