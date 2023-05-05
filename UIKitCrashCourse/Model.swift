//
//  Model.swift
//  UIKitCrashCourse
//
//  Created by Marcin Bartminski on 05/05/2023.
//

import Foundation

struct UsersResponse: Codable {
    let data: [PersonResponse]
}

struct PersonResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
}
