//
//  DeviceTableViewCell.swift
//  Smart Home
//
//  Created by Brody Sears on 1/26/22.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {

   // MARK: - IBOutlets
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var powerSwitchToggle: UISwitch!
    
    
    
    // MARK: - IBActions

    @IBAction func powerSwitchToggled(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    }
}
