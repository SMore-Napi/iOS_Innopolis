//
//  CombinedStatistics.swift
//  Habits
//
//  Created by Роман Солдатов on 21.04.2022.
//

import Foundation

struct CombinedStatistics {
    let userStatistics: [UserStatistics]
    let habitStatistics: [HabitStatistics]
}

extension CombinedStatistics: Codable { }

