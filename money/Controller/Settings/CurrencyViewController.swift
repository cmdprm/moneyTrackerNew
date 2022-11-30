//
//  CurrencyViewController.swift
//  money
//
//  Created by User on 30.11.2022.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cells = ["$ - Dollars", "€ - Euros", "₴ - Ukrainian hryvnia", "RUB - Russian Rubles", "BYN - Belarussian Rubles"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension CurrencyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            currency = "$"
            self.navigationController?.popToRootViewController(animated: true)
        case 1:
            currency = "€"
            self.navigationController?.popToRootViewController(animated: true)
        case 2:
            currency = "₴"
            self.navigationController?.popToRootViewController(animated: true)
        case 3:
            currency = "RUB"
            self.navigationController?.popToRootViewController(animated: true)
        case 4:
            currency = "BYN"
            self.navigationController?.popToRootViewController(animated: true)
        default:
            currency = "$"
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}

extension CurrencyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cells[indexPath.row]
        
        return cell
        
    }
}
