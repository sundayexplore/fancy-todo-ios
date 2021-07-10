//
//  ContentView.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    
    func sync() {
        AuthService().sync() { result in
            switch result {
            case .success(let data):
                authVM.user = data.user
                
            case .failure(let err):
                print(err.localizedDescription)
                authVM.user = nil
            }
        }
    }
    
    var body: some View {
        NavigationView{
            if authVM.user != nil {
                AppView()
            } else {
                AuthView()
            }
        }
        .onAppear {
            sync()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
