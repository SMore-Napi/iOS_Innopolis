//
//  Color.swift
//  Habits
//
//  Created by Роман Солдатов on 20.04.2022.
//

import Foundation

struct Color {
    let hue: Double
    let saturation: Double
    let brightness: Double
}

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
        case hue = "h"
        case saturation = "s"
        case brightness = "b"
    }
}
