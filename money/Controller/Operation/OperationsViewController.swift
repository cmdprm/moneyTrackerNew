//
//  OperationsViewController.swift
//  money
//
//  Created by User on 28.11.2022.
//

import UIKit

class OperationsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selIndexOfOperation: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "OperationTableViewCell", bundle: nil), forCellReuseIdentifier: "OperationReusableCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OperationDetail" {
            let operVC = segue.destination as! OperationDetailViewController
            operVC.indexOfOperation = self.selIndexOfOperation
        }
    }

}

extension OperationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selIndexOfOperation = indexPath.row
        performSegue(withIdentifier: "OperationDetail", sender: self)
    }
}

extension OperationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let operation = operations[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OperationReusableCell", for: indexPath) as! OperationTableViewCell

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        cell.nameLabel.text = operation.title
        cell.categoryLabel.text = operation.category.name
        cell.iconImage.image = UIImage(systemName: operation.category.icon)
        cell.iconView.backgroundColor = operation.category.color
        
        if operation.status == 0 {
            cell.amountLabel.textColor = UIColor(red: 0.85, green: 0.26, blue: 0.08, alpha: 1.00)
            cell.amountLabel.text = "-\(operation.amount)\(currency)"
        } else {
            cell.amountLabel.textColor = UIColor(red: 0.18, green: 0.49, blue: 0.20, alpha: 1.00)
            cell.amountLabel.text = "+\(operation.amount)\(currency)"
        }
        
        cell.accountLabel.text = operation.account
        cell.dateLabel.text = dateFormatter.string(from: operation.date)
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
