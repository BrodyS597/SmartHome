//
//  DeviceController.swift
//  Smart Home
//
//  Created by Brody Sears on 1/26/22.
//

import Foundation

class DeviceController {
 
    // MARK: -Properties
    
    // MARK: -Singleton
    static let sharedInstance = DeviceController()
    
    // MARK: -Source of Truth
    private(set) var deviceArray: [Device] = []
    
    // MARK: -Initializers
    init() {
        load()
    }
    
    // MARK: - CRUD FUNCS
    
    func create(name: String) {
        let device = Device(name: name)
        deviceArray.append(device)
        save()
    }
    
    func toggleIsOn(device: Device) {
        device.isON.toggle()
        save()
    }
    
    // MARK: - Persistance
    
    func save() {
        //get the address where we want to save the file to
        guard let devicesURL = devicesURL else { return }
        do {
            // convert into JSON data
            let data = try JSONEncoder().encode(deviceArray)
            // save the data to the url from above
            try data.write(to: devicesURL)
        } catch {
            print("There was an error saving to device", error)
        }
    }
    
    func load() {
        //get the address we want to load from
        guard let devicesURL = devicesURL else { return }
        do {
            //load the data from the url
            let data = try Data(contentsOf: devicesURL)
            //convert the data into our swift class
            let devices = try JSONDecoder().decode([Device].self, from: data)
            self.deviceArray = devices
        } catch {
            print("Error loading from device", error)
        }
        
    }
    
    // MARK: -Computed property
    private var devicesURL: URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let url = documentDirectory.appendingPathComponent("device.JSON")
        return url
    }
    
}//End of class

