//
//  SignInViewModel.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/9/21.
//

import Foundation

class SignInViewModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    @Published var focusable: [Bool] = [false, false]
    var isSecureTextEntry: Bool = true
    
    func signIn() {
        let defaults = UserDefaults.standard
        
        AuthService().signIn(email: email, password: password) { result in
            switch result {
            case .success(let data):
                defaults.setValue(data.act, forKey: "act")
                defaults.setValue(data.rft, forKey: "rft")
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func signOut() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "act")
        defaults.removeObject(forKey: "rft")
    }
}
