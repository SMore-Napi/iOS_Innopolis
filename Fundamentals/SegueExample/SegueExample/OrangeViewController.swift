//
//  OrangeViewController.swift
//  SegueExample
//
//  Created by Роман Солдатов on 07.02.2022.
//

import UIKit

class OrangeViewController: UIViewController {

    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var moveSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    @IBAction func greenButtonTaped(_ sender: Any) {
        if moveSwitch.isOn {
            performSegue(withIdentifier: "green", sender: nil)
        }
    }
    
    @IBAction func redButtonTaped(_ sender: Any) {
        if moveSwitch.isOn {
            performSegue(withIdentifier: "red", sender: nil)
        }
    }
}
