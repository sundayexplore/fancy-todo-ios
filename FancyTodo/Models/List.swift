//
//  List.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import Foundation

struct List: Codable, Hashable, Identifiable {
    var id: String
    var userId: String
    var name: String
    var color: String
}
