//
//  SignUpView.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/10/21.
//

import Foundation
import SwiftUI

class SignUpData: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
}

struct SignUpEmailView: View {
    @ObservedObject var data: SignUpData
    
    var body: some View {
        VStack {
            TextField("Email", text: $data.email)
            
            NavigationLink(destination: SignUpNamePasswordView(data: self.data)) {
                HStack {
                    Spacer()
                    Text("Sign up with email")
                    Spacer()
                }
            }
        }
        .navigationTitle("Sign up")
    }
}

struct SignUpNamePasswordView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var data: SignUpData
    
    var backButton: some View {
        Button(action: { self.presentationMode.wrappedValue.dismiss() } ) {
            HStack {
                Image(systemName: "chevron.backward")
                    .aspectRatio(contentMode: .fit)
                Text(data.email)
                    .fontWeight(.regular)
            }
        }
    }
    
    var body: some View {
        Text(data.email)
            .navigationTitle("Almost there")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: self.backButton)
    }
}

struct SignUpView: View {
    @ObservedObject var data: SignUpData = SignUpData()
    //    @EnvironmentObject private var authVM: AuthViewModel
    
    //    func signUp() {
    //        let defaults = UserDefaults.standard
    //
    //        AuthService().signUp(name: name, email: email, password: password) { result in
    //            switch result {
    //            case .success(let data):
    //                defaults.setValue(data.act, forKey: "act")
    //                defaults.setValue(data.rft, forKey: "rft")
    //                authVM.user = data.user
    //
    //            case .failure(let err):
    //                print(err.localizedDescription)
    //            }
    //        }
    //    }
    
    var body: some View {
        SignUpEmailView(data: self.data)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
