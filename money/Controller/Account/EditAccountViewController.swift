//
//  EditAccountViewController.swift
//  money
//
//  Created by User on 26.11.2022.
//

import UIKit

class EditAccountViewController: UIViewController {
    
    @IBOutlet weak var newNameField: UITextField!
    @IBOutlet weak var newBalanceField: UITextField!

    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    var layout = SetupLayout()
    
    let vibration = UIImpactFeedbackGenerator(style: .heavy)
    
    var indexOfAccount: Int = 0
    
    var isMain: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.setLayout(button: saveButton, view: saveView)
        
        let account = accounts[indexOfAccount]
        
        newNameField.text = account.name
        newBalanceField.text = "\(account.balance)"
        
        isMain = account.isMain
    }

    @IBAction func tapped(_ sender: Any) {
        newNameField.resignFirstResponder()
        newBalanceField.resignFirstResponder()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        vibration.impactOccurred()
        
        let name = newNameField.text
        let balance = newBalanceField.text
        
        if name != "" {
            if balance != "" {
                accounts[indexOfAccount] = Account(name: name!, balance: Float(balance!)!, isMain: isMain)
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
}
