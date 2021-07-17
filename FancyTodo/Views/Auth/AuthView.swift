//
//  AuthView.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/11/21.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 200) {
            Text("Fancy Todo")
                .bold()
                .font(.largeTitle)
            
            VStack {
                NavigationLink(destination: SignUpView()) {
                    HStack {
                        Image(systemName: "envelope")
                            .font(.callout)
                        Text("Continue with email")
                            .fontWeight(.semibold)
                            .font(.callout)
                    }
                    .foregroundColor(Color.black)
                    .padding()
                    .border(Color.black, width: 2)
                }
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
