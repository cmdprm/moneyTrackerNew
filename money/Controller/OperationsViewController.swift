//
//  OperationsViewController.swift
//  money
//
//  Created by User on 28.11.2022.
//

import UIKit

class OperationsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "OperationTableViewCell", bundle: nil), forCellReuseIdentifier: "OperationReusableCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension OperationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
        cell.categoryLabel.text = operation.category
        cell.amountLabel.text = "\(operation.amount)$"
        
        if operation.status == 0 {
            cell.amountLabel.textColor = .red
        } else {
            cell.amountLabel.textColor = .green
        }
        
        cell.dateLabel.text = dateFormatter.string(from: operation.date)
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
