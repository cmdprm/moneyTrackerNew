//
//  CategoryDetailViewController.swift
//  money
//
//  Created by User on 05.12.2022.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var deleteButton: UIButton!
    
    var typeOfCategory: String?
    var selectedIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        iconView.layer.cornerRadius = iconView.layer.bounds.height / 2
        iconView.clipsToBounds = true
        
        editView.layer.cornerRadius = 15
        
        editButton.layer.cornerRadius = 15
        editButton.setTitle("", for: .normal)

        deleteView.layer.cornerRadius = 15
        
        deleteButton.layer.cornerRadius = 15
        deleteButton.setTitle("", for: .normal)
        
        
        if typeOfCategory == "Income" {
            let category = catOfIncomes[selectedIndex!]
            
            iconView.backgroundColor = category.color
            iconImage.image = UIImage(systemName: category.icon)
            
            nameLabel.text = category.name
            typeLabel.text = self.typeOfCategory!
        }
        
        if typeOfCategory == "Waste" {
            let category = catOfWastes[selectedIndex!]
            
            iconView.backgroundColor = category.color
            iconImage.image = UIImage(systemName: category.icon)
            
            nameLabel.text = category.name
            typeLabel.text = self.typeOfCategory!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if typeOfCategory == "Income" {
            nameLabel.text = catOfIncomes[selectedIndex!].name
        }
        
        if typeOfCategory == "Waste" {
            nameLabel.text = catOfWastes[selectedIndex!].name
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditCategory" {
            let VC = segue.destination as! EditCategoryViewController
            VC.typeOfCategory = self.typeOfCategory!
            VC.selectedIndex = self.selectedIndex!
        }
    }

    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "EditCategory", sender: self)
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "This category will be deleted!", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Delete", style: .destructive) { _ in
            
            if self.typeOfCategory == "Income" {
                catOfIncomes.remove(at: self.selectedIndex!)
            }
            
            if self.typeOfCategory == "Waste" {
                catOfWastes.remove(at: self.selectedIndex!)
            }
            
            self.navigationController?.popViewController(animated: true)
        }
        let noButton = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addAction(noButton)
        alert.addAction(yesButton)
        
        present(alert, animated: true)
    }
    
}
