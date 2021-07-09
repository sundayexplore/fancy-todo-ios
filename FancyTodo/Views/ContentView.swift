//
//  ContentView.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 200) {
                Text("Fancy Todo")
                    .bold()
                    .font(.largeTitle)
                
                VStack {
                    NavigationLink(destination: SignInView()) {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
