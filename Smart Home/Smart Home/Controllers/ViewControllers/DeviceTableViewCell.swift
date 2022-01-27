//
//  DeviceTableViewCell.swift
//  Smart Home
//
//  Created by Brody Sears on 1/26/22.
//

import UIKit

protocol DeviceTableViewCellDelegate: AnyObject{
    func isOnSwitchToggled(cell: DeviceTableViewCell)
}

class DeviceTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var powerSwitchToggle: UISwitch!
    
    weak var delegate: DeviceTableViewCellDelegate?
    
    // MARK: -Helper Function
    func updateViews(device: Device) {
        deviceNameLabel.text = device.name
        powerSwitchToggle.isOn = device.isON
    }
    
    // MARK: - IBActions
    
    @IBAction func powerSwitchToggled(_ sender: Any) {
        delegate?.isOnSwitchToggled(cell: self)
    }
}// End of class 
