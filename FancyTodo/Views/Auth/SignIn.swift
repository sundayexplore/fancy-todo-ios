//
//  SignIn.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import SwiftUI

struct SignIn: View {
    @State var email: String = ""
    @State var password: String = ""
    
    func handleSignIn() {
        print("SIGNED IN!")
    }
    
    var body: some View {
        VStack {
            Text("Welcome back!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            Button(action: handleSignIn) {
                Text("Sign in")
            }
        }
        .padding()
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
