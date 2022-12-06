//
//  AllCategoriesViewController.swift
//  money
//
//  Created by User on 05.12.2022.
//

import UIKit

class IncomeCategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var typeOfCategory: String = "Income"
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryReusableCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "IncomeDetail" {
            let VC = segue.destination as! CategoryDetailViewController
            VC.typeOfCategory = self.typeOfCategory
            VC.selectedIndex = self.selectedIndex
        }
    }

}

extension IncomeCategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        performSegue(withIdentifier: "IncomeDetail", sender: self)
    }
}

extension IncomeCategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catOfIncomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = catOfIncomes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryReusableCell", for: indexPath) as! CategoryTableViewCell
        
        cell.categoryView.layer.cornerRadius = 8
        
        cell.iconView.backgroundColor = category.color
        cell.iconImage.image = UIImage(systemName: category.icon)
        cell.categoryLabel.text = category.name
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
