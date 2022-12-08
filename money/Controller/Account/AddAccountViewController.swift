//
//  AddAccountViewController.swift
//  money
//
//  Created by User on 28.11.2022.
//

import UIKit

class AddAccountViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var balanceField: UITextField!
    
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    var layout = SetupLayout()
    
    let vibration = UIImpactFeedbackGenerator(style: .heavy)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout.setLayout(button: saveButton, view: saveView)
    }

    @IBAction func tapped(_ sender: Any) {
        nameField.resignFirstResponder()
        balanceField.resignFirstResponder()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        vibration.impactOccurred()
        
        let alertName = UIAlertController(title: "Warning", message: "Please, enter name!", preferredStyle: .alert)
        let alertBalance = UIAlertController(title: "Warning", message: "Please, enter balance!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alertName.addAction(okButton)
        alertBalance.addAction(okButton)
        
        let name = nameField.text
        let balance = balanceField.text
        
        if name != "" {
            if balance != "" {
                let account = Account(name: name!, balance: Float(balance!)!, isMain: false)
                accounts.append(account)
                self.navigationController?.popViewController(animated: true)
            } else {
                present(alertBalance, animated: true)
            }
        } else {
            present(alertName, animated: true)
        }
    }
    
}
