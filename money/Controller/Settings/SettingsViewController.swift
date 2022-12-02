//
//  SettingsViewController.swift
//  money
//
//  Created by User on 30.11.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cells = ["Add Category", "Currency", "Data restore", "About"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "SettingsCategory", sender: self)
        case 1:
            performSegue(withIdentifier: "SettingsCurrency", sender: self)
        case 2:
            print("Data restore")
        case 3:
            print("About")
        default:
            print("Error")
        }
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cells[indexPath.row]
        
        return cell
    }
}
