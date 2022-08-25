//
//  OrderConfirmationViewController.swift
//  OrderApp
//
//  Created by Роман Солдатов on 12.04.2022.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    let minutesToPrepare: Int
    
    var minutesLeft: Int
    
    var minutesToPrepareOrder = 0

    @IBOutlet weak var confirmationLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMinutesLeft()
        updateProgressBar()
    }
    
    init?(coder: NSCoder, minutesToPrepare: Int) {
        self.minutesToPrepare = minutesToPrepare
        self.minutesLeft = minutesToPrepare
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateProgressBar() {
        let secondsToPrepare = minutesToPrepare * 60
        var i = 0
        var prog : Float = 0.0
        let step : Float = (Float(1.0) / Float(secondsToPrepare))
        DispatchQueue.global().async {
            while i < secondsToPrepare {
                DispatchQueue.main.async { () -> Void in self.progressBar.setProgress(prog, animated: true) }
                prog += step
                i = i + 1
                sleep(1)
            }
        }
    }
    
    func updateMinutesLeft() {
        var i = 0
        DispatchQueue.global().async {
            while i < self.minutesToPrepare {
                self.minutesLeft = self.minutesToPrepare - i
                DispatchQueue.main.async { () -> Void in self.updateConfirmationLabel() }
                i = i + 1
                sleep(60)
            }
            DispatchQueue.main.async { () -> Void in self.orderDelivered() }
      }
    }
    
    func updateConfirmationLabel() {
        confirmationLabel.text = "Thank you for your order! Your wait time is approximately \(minutesLeft) minutes."
    }
    
    func orderDelivered() {
        confirmationLabel.text = "Your order was delivered!"
    }
}
