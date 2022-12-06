//
//  IncomeAccountsViewController.swift
//  money
//
//  Created by User on 29.11.2022.
//

import UIKit

protocol AccountPassingDelegate {
    func sendAccount(account: Account, index: Int)
}

class SelectAccountsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: AccountPassingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "AccountTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountReusableCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SelectAccountsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.sendAccount(account: accounts[indexPath.row], index: indexPath.row)
        self.dismiss(animated: true)
    }
}

extension SelectAccountsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let account = accounts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountReusableCell", for: indexPath) as! AccountTableViewCell
        
        if account.isMain == true {
            cell.crownImage.isHidden = false
        } else {
            cell.crownImage.isHidden = true
        }
        
        cell.nameLabel.text = account.name
        cell.balanceLabel.text = "\(account.balance)\(currency)"
        cell.selectionStyle = .none
        
        return cell
    }
}
