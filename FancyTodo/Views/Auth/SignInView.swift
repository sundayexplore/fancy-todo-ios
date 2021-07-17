//
//  SignIn.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var auth: Auth
    @State var email: String = ""
    @State var password: String = ""
    @State var focusable: [Bool] = [false, false]
    @State var isSecureTextEntry: Bool = true
    
    func signIn() {
        let defaults = UserDefaults.standard
        
        AuthService().signIn(email: email, password: password) { result in
            switch result {
            case .success(let data):
                defaults.setValue(data.act, forKey: "act")
                defaults.setValue(data.rft, forKey: "rft")
                self.auth.user = data.user
                
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
            .environmentObject(Auth())
    }
}

