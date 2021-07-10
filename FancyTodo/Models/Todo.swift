//
//  Todo.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import Foundation

struct Todo: Codable, Hashable {
    var _id: String
    var userId: String
    var listId: String?
    var name: String
    var notes: String?
    var url: String?
    var isDateSet: Bool
    var isTimeSet: Bool
    var due: Date?
    var completed: Bool
    var priority: TodoPriority

    enum TodoPriority: String, CaseIterable, Codable {
        case NONE = "none"
        case LOW = "low"
        case MEDIUM = "medium"
        case HIGH = "high"
    }
}
