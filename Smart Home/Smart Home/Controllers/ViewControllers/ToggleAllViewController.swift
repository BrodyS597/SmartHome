//
//  ToggleAllViewController.swift
//  Smart Home
//
//  Created by Brody Sears on 1/27/22.
//

import UIKit

//Global Property
let TurnOnAllNotificationName = Notification.Name("TurnOnAllDevicesNotification")
let TurnOffAllNotifcationName = Notification.Name("TurnOffAllDevicesNotification")

class ToggleAllViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func turnAllOnButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: TurnOnAllNotificationName, object: nil)
    }
    
    @IBAction func turnAllOffButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: TurnOffAllNotifcationName, object: nil)
    }
}
