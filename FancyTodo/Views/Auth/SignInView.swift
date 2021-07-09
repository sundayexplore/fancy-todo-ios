//
//  SignIn.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var signInVM = SignInViewModel()
    
    var body: some View {
        VStack {
            CustomTextField(
                label: "Email",
                text: $signInVM.email,
                focusable: $signInVM.focusable,
                returnKeyType: .next,
                tag: 0
            )
            .padding()
            .frame(height: 48)
            
            CustomTextField (
                label: "Password",
                text: $signInVM.password,
                focusable: $signInVM.focusable,
                isSecureTextEntry: $signInVM.isSecureTextEntry,
                returnKeyType: .done,
                tag: 1
            )
            .padding()
            .frame(height: 48)
            
            Button("Continue") {
                signInVM.signIn()
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

