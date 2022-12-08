//
//  ButtonLayout.swift
//  money
//
//  Created by User on 09.12.2022.
//

import UIKit

class SetupLayout {
    
    func setLayout(button: UIButton, view: UIView, isMain: Bool = false) {
        if isMain == true {
            view.layer.cornerRadius = view.frame.height / 8
            
            view.layer.shadowColor = UIColor.gray.cgColor
            view.layer.shadowOpacity = 0.2
            view.layer.shadowRadius = 5
            
            button.layer.cornerRadius = button.frame.height / 8
            button.setTitle("", for: .normal)
        } else {
            view.layer.cornerRadius = 15
            
            button.layer.cornerRadius = 15
            button.setTitle("", for: .normal)
        }
    }
    
    
    
}
