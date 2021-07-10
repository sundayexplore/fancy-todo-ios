//
//  User.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/8/21.
//

import Foundation

struct User: Codable, Hashable {
    var _id: String
    var name: String
    var email: String
    var password: String?
    var verified: Bool
    var profileImageURL: String?
}
