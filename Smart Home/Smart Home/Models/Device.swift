//
//  Device.swift
//  Smart Home
//
//  Created by Brody Sears on 1/26/22.
//

import Foundation
import CoreText

class Device: Codable {
    
    // MARK: - Properties
    let name: String
    var isON: Bool
    
    // MARK: - Initializer
    init(name: String, isON: Bool = false) {
        self.name = name
        self.isON = isON
    }
}// End of class
