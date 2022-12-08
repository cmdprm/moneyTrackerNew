//
//  WarningAlert.swift
//  money
//
//  Created by User on 09.12.2022.
//

import UIKit

class WarningAlert {
    
    func getWarningAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Warning!", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        
        return alert
    }
    
}
