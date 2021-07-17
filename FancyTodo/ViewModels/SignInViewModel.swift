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
}
