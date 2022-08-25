//
//  UserCount.swift
//  Habits
//
//  Created by Роман Солдатов on 21.04.2022.
//

import Foundation

struct UserCount {
    let user: User
    let count: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(user)
    }
    
    static func ==(_ lhs: UserCount, _ rhs: UserCount) -> Bool {
        return lhs.user == rhs.user
    }
}

extension UserCount: Codable { }

extension UserCount: Hashable { }
