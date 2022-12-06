//
//  EditCategoryViewController.swift
//  money
//
//  Created by User on 05.12.2022.
//

import UIKit

class EditCategoryViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    var typeOfCategory: String?
    var selectedIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        saveView.layer.cornerRadius = 15
        
        saveButton.layer.cornerRadius = 15
        saveButton.setTitle("", for: .normal)
        
        if typeOfCategory == "Income" {
            let category = catOfIncomes[selectedIndex!]
            
            nameField.text = category.name
        }
        
        if typeOfCategory == "Waste" {
            let category = catOfWastes[selectedIndex!]
            
            nameField.text = category.name
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.resignFirstResponder()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if typeOfCategory == "Income" {
            if nameField.text != "" {
                catOfIncomes[selectedIndex!].name = nameField.text!
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        if typeOfCategory == "Waste" {
            if nameField.text != "" {
                catOfWastes[selectedIndex!].name = nameField.text!
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

}
