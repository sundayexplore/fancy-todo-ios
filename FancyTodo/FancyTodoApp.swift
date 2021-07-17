//
//  FancyTodoApp.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import SwiftUI

@main
struct FancyTodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Auth())
        }
    }
}
