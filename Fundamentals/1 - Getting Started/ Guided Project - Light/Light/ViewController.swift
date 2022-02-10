//
//  ViewController.swift
//  Light
//
//  Created by Роман Солдатов on 19.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    private var status: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
    }
    
    @IBAction func toggleLightButtonPressed(_ sender: Any) {
        status.toggle()
        if status {
            statusLabel.text = "Light is on"
            view.backgroundColor = UIColor.yellow
        } else {
            statusLabel.text = "Light is off"
            view.backgroundColor = UIColor.gray
        }
    }
}

extension UIColor {
    
    open class var myCustomColor: UIColor {
        UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
    }
    
}
