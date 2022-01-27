//
//  DevicesTableViewController.swift
//  Smart Home
//
//  Created by Brody Sears on 1/26/22.
//

import UIKit

class DevicesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DeviceController.sharedInstance.deviceArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else { return UITableViewCell()}
        let deviceToUpdate = DeviceController.sharedInstance.deviceArray[indexPath.row]
        
        cell.delegate = self
        cell.updateViews(device: deviceToUpdate)
        
        return cell
    }
    
    private func presentNewDeviceAlertController() {
        let alertController = UIAlertController(title: "Add a Device", message: "What needs to be added?", preferredStyle: .alert)
        alertController.addTextField{ deviceNameTextField in deviceNameTextField.placeholder = "Device name..." }
        
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        
        let confirmAction = UIAlertAction(title: "Create", style: .default) { _ in
            guard let contentTextField = alertController.textFields?.first,
                  let name = contentTextField.text else { return }
            DeviceController.sharedInstance.create(name: name)
            self.tableView.reloadData()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        presentNewDeviceAlertController()
    }
    
} // End of class

extension DevicesTableViewController: DeviceTableViewCellDelegate {
    func isOnSwitchToggled(cell: DeviceTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let device = DeviceController.sharedInstance.deviceArray[indexPath.row]
        DeviceController.sharedInstance.toggleIsOn(device: device)
        cell.updateViews(device: device)
    }
}
