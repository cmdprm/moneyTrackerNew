//
//  CategoryViewController.swift
//  money
//
//  Created by User on 01.12.2022.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var iconCollectionView: UICollectionView!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    @IBOutlet weak var incomeView: UIView!
    @IBOutlet weak var incomeButton: UIButton!
    
    @IBOutlet weak var wasteView: UIView!
    @IBOutlet weak var wasteButton: UIButton!
    
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    let icons = ["gamecontroller.fill", "car.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill", "lightbulb.fill"]
    
    let colors = [
        UIColor(red: 0.40, green: 0.73, blue: 0.42, alpha: 1.00),
        UIColor(red: 0.15, green: 0.65, blue: 0.60, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00),
        UIColor(red: 0.15, green: 0.78, blue: 0.85, alpha: 1.00)
    ]
    
    var iconIndex: Int?
    var colorIndex: Int?
    
    var isIncomeSelected = false
    var isWasteSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        incomeView.layer.cornerRadius = 15
        
        incomeButton.layer.cornerRadius = 15
        incomeButton.setTitle("", for: .normal)
        
        wasteView.layer.cornerRadius = 15
        
        wasteButton.layer.cornerRadius = 15
        wasteButton.setTitle("", for: .normal)
        
        saveView.layer.cornerRadius = 15
        
        saveButton.layer.cornerRadius = 15
        saveButton.setTitle("", for: .normal)
        
        iconCollectionView.register(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IconReusableCell")
        iconCollectionView.delegate = self
        iconCollectionView.dataSource = self
        
        colorCollectionView.register(UINib(nibName: "ColorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColorReusableCell")
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.resignFirstResponder()
    }
    
    func getWarningAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Warning!", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        
        return alert
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
        
        var status: Int?
        
        if name != "" {
            if icon != nil {
                if color != nil {
                    if isIncomeSelected == false && isWasteSelected == false {
                        present(getWarningAlert(message: "Please, select a type of category!"), animated: true)
                    } else {
                        if isIncomeSelected == true {
                            status = 1
                        } else {
                            status = 0
                        }
                        
                        if status == 1 {
                            let newCategory = Category(name: name!, title: name!, icon: icons[icon!], color: colors[color!])
                            catOfIncomes.append(newCategory)
                            self.navigationController?.popToRootViewController(animated: true)
                        } else if status == 0 {
                            let newCategory = Category(name: name!, title: name!, icon: icons[icon!], color: colors[color!])
                            catOfWastes.append(newCategory)
                            self.navigationController?.popToRootViewController(animated: true)
                        } else {
                            print("Error!")
                        }
                        
                    }
                } else {
                    present(getWarningAlert(message: "Please, select a color!"), animated: true)
                }
            } else {
                present(getWarningAlert(message: "Please, select a icon!"), animated: true)
            }
        } else {
            present(getWarningAlert(message: "Please, enter a name!"), animated: true)
        }
        
    }
    
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == iconCollectionView {
            self.iconIndex = indexPath.row
            iconCollectionView.reloadData()
        } else {
            self.colorIndex = indexPath.row
            colorCollectionView.reloadData()
        }
        
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == iconCollectionView {
            return icons.count
        } else {
            return colors.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == iconCollectionView {
            
            let cell = iconCollectionView.dequeueReusableCell(withReuseIdentifier: "IconReusableCell", for: indexPath) as! IconCollectionViewCell
            
            cell.iconView.backgroundColor = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1.00)
            cell.iconImage.tintColor = .black
            cell.iconImage.image = UIImage(systemName: icons[indexPath.row])
            
            if self.iconIndex == indexPath.row {
                cell.iconView.backgroundColor = UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1.00)
                cell.iconImage.tintColor = .white
            }
            
            return cell
            
        } else {
            
            let cell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "ColorReusableCell", for: indexPath) as! ColorCollectionViewCell
            
            cell.colorView.backgroundColor = colors[indexPath.row]
            cell.colorView.layer.borderWidth = 0
            
            if self.colorIndex == indexPath.row {
                cell.colorView.layer.borderWidth = 4
            }
            
            return cell
            
        }
        
    }
}
