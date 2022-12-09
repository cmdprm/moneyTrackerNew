//
//  CurrencyViewController.swift
//  money
//
//  Created by User on 30.11.2022.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currency = SetupCurrency()
    
    let cells = ["$ - Dollars", "€ - Euros", "₴ - Ukrainian hryvnia", "RUB - Russian Rubles", "BYN - Belarussian Rubles"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension CurrencyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currency.setupCurrency(index: indexPath.row)
        
        self.navigationController?.popToRootViewController(animated: true)
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
