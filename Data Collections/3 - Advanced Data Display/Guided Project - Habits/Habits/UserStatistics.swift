//
//  UserStatistics.swift
//  Habits
//
//  Created by Роман Солдатов on 21.04.2022.
//

import Foundation

struct UserStatistics {
    let user: User
    let habitCounts: [HabitCount]
}

extension UserStatistics: Codable { }

