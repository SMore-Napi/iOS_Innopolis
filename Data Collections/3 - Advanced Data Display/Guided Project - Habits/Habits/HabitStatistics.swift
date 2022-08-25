//
//  HabitStatistics.swift
//  Habits
//
//  Created by Роман Солдатов on 21.04.2022.
//

import Foundation

struct HabitStatistics {
    let habit: Habit
    let userCounts: [UserCount]
}

extension HabitStatistics: Codable { }

