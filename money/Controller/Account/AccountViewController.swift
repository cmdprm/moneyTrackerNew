//
//  AccountViewController.swift
//  money
//
//  Created by User on 25.11.2022.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addNewView: UIView!
    @IBOutlet weak var addNewButton: UIButton!
    
    var layout = SetupLayout()
    
    var selIndexOfAccount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.setLayout(button: addNewButton, view: addNewView)

        tableView.register(UINib(nibName: "AccountTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountReusableCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AccountDetail" {
            let acDetailVC = segue.destination as! AccountDetailViewController
            acDetailVC.indexOfAccount = self.selIndexOfAccount
        }
    }
    
    @IBAction func addNewButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddAccount", sender: self)
    }
    
}

extension AccountViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selIndexOfAccount = indexPath.row
        performSegue(withIdentifier: "AccountDetail", sender: self)
    }
}

extension AccountViewController: UITableViewDataSource {
    
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
