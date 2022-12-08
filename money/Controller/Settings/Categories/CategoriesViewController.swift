//
//  CategoriesViewController.swift
//  money
//
//  Created by User on 05.12.2022.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cells = ["Income Categories", "Waste Categories", "Add New Category"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "IncomeCategories", sender: self)
        case 1:
            performSegue(withIdentifier: "WasteCategories", sender: self)
        case 2:
            performSegue(withIdentifier: "AddCategory", sender: self)
        default:
            print("Error")
        }
    }
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cells[indexPath.row]
        
        return cell
    }
}
