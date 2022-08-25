//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Роман Солдатов on 02.03.2022.
//

import UIKit


class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        
        var breakfast: Meal = Meal(name: "breakfast", food: [])
        var lunch: Meal = Meal(name: "lunch", food: [])
        var dinner: Meal = Meal(name: "dinner", food: [])
        
        return [breakfast, lunch, dinner]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
