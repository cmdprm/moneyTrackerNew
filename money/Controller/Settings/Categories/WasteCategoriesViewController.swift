//
//  WasteCategoriesViewController.swift
//  money
//
//  Created by User on 05.12.2022.
//

import UIKit

class WasteCategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var typeOfCategory: String = "Waste"
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
        if segue.identifier == "WasteDetail" {
            let VC = segue.destination as! CategoryDetailViewController
            VC.typeOfCategory = self.typeOfCategory
            VC.selectedIndex = self.selectedIndex
        }
    }
}

extension WasteCategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        performSegue(withIdentifier: "WasteDetail", sender: self)
    }
}

extension WasteCategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catOfWastes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = catOfWastes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryReusableCell", for: indexPath) as! CategoryTableViewCell
        
        cell.categoryView.layer.cornerRadius = 8
        
        cell.iconView.backgroundColor = category.color
        cell.iconImage.image = UIImage(systemName: category.icon)
        cell.categoryLabel.text = category.name
        
        cell.selectionStyle = .none
        
        return cell
    }
}
