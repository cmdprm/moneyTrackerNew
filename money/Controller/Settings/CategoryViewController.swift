//
//  CategoryViewController.swift
//  money
//
//  Created by User on 01.12.2022.
//

import UIKit

class CategoryViewController: UIViewController, SelectIconDelegate, SelectColorDelegate {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconButton: UIButton!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var selColorView: UIView!
    
    @IBOutlet weak var incomeView: UIView!
    @IBOutlet weak var incomeButton: UIButton!
    
    @IBOutlet weak var wasteView: UIView!
    @IBOutlet weak var wasteButton: UIButton!
    
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    var layout = SetupLayout()
    var alert = WarningAlert()
    var category = NewCategory()
    
    var iconIndex: Int?
    var colorIndex: Int?
    
    var isIncomeSelected = false
    var isWasteSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.setLayout(button: iconButton, view: iconView)
        layout.setLayout(button: colorButton, view: colorView)
        layout.setLayout(button: incomeButton, view: incomeView)
        layout.setLayout(button: wasteButton, view: wasteView)
        layout.setLayout(button: saveButton, view: saveView)
        
        if iconIndex == nil {
            iconImage.isHidden = true
        }
        
        selColorView.layer.cornerRadius = selColorView.layer.bounds.width / 2
        selColorView.clipsToBounds = true
        
        if colorIndex == nil {
            selColorView.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if iconIndex != nil {
            iconLabel.text = "Selected Icon:"
            iconImage.isHidden = false
            iconImage.image = UIImage(systemName: icons[iconIndex!])
        }
        
        if colorIndex != nil {
            colorLabel.text = "Selected Color:"
            selColorView.isHidden = false
            selColorView.backgroundColor = colors[colorIndex!]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectIcon" {
            let VC = segue.destination as! SelectIconViewController
            VC.delegate = self
        }
        
        if segue.identifier == "SelectColor" {
            let VC = segue.destination as! SelectColorViewController
            VC.delegate = self
        }
    }
    
    func transferIconIndex(index: Int) {
        self.iconIndex = index
    }
    
    func transferColorIndex(index: Int) {
        self.colorIndex = index
    }

    @IBAction func iconPressed(_ sender: Any) {
        performSegue(withIdentifier: "SelectIcon", sender: self)
    }
    
    @IBAction func colorPressed(_ sender: Any) {
        performSegue(withIdentifier: "SelectColor", sender: self)
    }
    
    @IBAction func incomePressed(_ sender: Any) {
        incomeView.backgroundColor = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1.00)
        isIncomeSelected = true
        
        if isWasteSelected == true {
            isWasteSelected = false
            wasteView.backgroundColor = UIColor(red: 1.00, green: 0.67, blue: 0.57, alpha: 1.00)
        }
    }
    
    @IBAction func wastePressed(_ sender: Any) {
        wasteView.backgroundColor = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1.00)
        isWasteSelected = true
        
        if isIncomeSelected == true {
            isIncomeSelected = false
            incomeView.backgroundColor = UIColor(red: 0.65, green: 0.84, blue: 0.65, alpha: 1.00)
        }
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
        let name = nameField.text
        let icon = iconIndex
        let color = colorIndex
        
        if name != "" {
            if icon != nil {
                if color != nil {
                    if isIncomeSelected == false && isWasteSelected == false {
                        present(alert.getWarningAlert(message: "Please, select a type of category!"), animated: true)
                    } else {
                        let newCategory = Category(name: name!, title: name!, icon: icons[icon!], color: colors[color!])
                        
                        let result = category.addCategory(isIncomeSelected: isIncomeSelected, newCategory: newCategory)
                        
                        if result == true {
                            self.navigationController?.popToRootViewController(animated: true)
                        } else {
                            print("Error!")
                        }
                    }
                } else {
                    present(alert.getWarningAlert(message: "Please, select a color!"), animated: true)
                }
            } else {
                present(alert.getWarningAlert(message: "Please, select a icon!"), animated: true)
            }
        } else {
            present(alert.getWarningAlert(message: "Please, enter a name!"), animated: true)
        }
        
    }
    
}
