//
//  DeviceTableViewCell.swift
//  Smart Home
//
//  Created by Brody Sears on 1/26/22.
//

import UIKit

protocol DeviceDelegate: AnyObject{
    func setIsOnButtonWasTapped(cell: DeviceTableViewCell)
}

class DeviceTableViewCell: UITableViewCell {

   // MARK: - IBOutlets
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var powerSwitchToggle: UISwitch!
    
    weak var delegate: DeviceDelegate?
    
    // MARK: -Helper Function
    func updateViews(device: Device) {
        deviceNameLabel.text = device.name
        powerSwitchToggle.isOn = device.isON
    }
    
    // MARK: - IBActions

    @IBAction func powerSwitchToggled(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
    }
}
