//
//  Order.swift
//  OrderApp
//
//  Created by Роман Солдатов on 12.04.2022.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]

    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
