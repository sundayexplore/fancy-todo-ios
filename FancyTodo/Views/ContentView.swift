//
//  ContentView.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var auth: Auth
    
    func sync() {
        AuthService().sync() { result in
            switch result {
            case .success(let data):
                auth.user = data.user
                
            case .failure:
                auth.user = nil
            }
        }
    }
    
    var body: some View {
        NavigationView{
            if auth.user != nil {
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
            .environmentObject(Auth())
    }
}
