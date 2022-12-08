//
//  AccountDetailViewController.swift
//  money
//
//  Created by User on 26.11.2022.
//

import UIKit

class AccountDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    /// Edit Properties
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var editButton: UIButton!
    
    /// Primary Properties
    @IBOutlet weak var primaryView: UIView!
    @IBOutlet weak var primaryButton: UIButton!
    @IBOutlet weak var primaryIconImage: UIImageView!
    @IBOutlet weak var primaryButtonLabel: UILabel!
    
    
    /// Delete Properties
    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var deleteIconImage: UIImageView!
    @IBOutlet weak var deleteButtonLabel: UILabel!
    
    var layout = SetupLayout()
    
    var indexOfAccount: Int = 0
    
    let vibration = UIImpactFeedbackGenerator(style: .heavy)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.setLayout(button: editButton, view: editView)
        layout.setLayout(button: primaryButton, view: primaryView)
        layout.setLayout(button: deleteButton, view: deleteView)
        
        let account = accounts[indexOfAccount]

        title = "\(account.name) Detail"
        
        nameLabel.text = "\(account.name) Account"
        balanceLabel.text = "\(account.balance)\(currency)"
        
        if account.isMain == true {
            statusLabel.text = "Primary Account"
            
            primaryButton.isEnabled = false
            primaryIconImage.tintColor = .gray
            primaryButtonLabel.textColor = .gray
            
            deleteButton.isEnabled = false
            deleteIconImage.tintColor = .gray
            deleteButtonLabel.textColor = .gray
        } else {
            statusLabel.text = "Secondary Account"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let account = accounts[indexOfAccount]

        title = "\(account.name) Detail"
        
        nameLabel.text = "\(account.name) Account"
        balanceLabel.text = "\(account.balance)\(currency)"
        
        if account.isMain == true {
            statusLabel.text = "Primary Account"
            
            primaryButton.isEnabled = false
            primaryIconImage.tintColor = .gray
            primaryButtonLabel.textColor = .gray
            
            deleteButton.isEnabled = false
            deleteIconImage.tintColor = .gray
            deleteButtonLabel.textColor = .gray
        } else {
            statusLabel.text = "Secondary Account"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditAccount" {
            let editAccVC = segue.destination as! EditAccountViewController
            editAccVC.indexOfAccount = self.indexOfAccount
        }
    }

    @IBAction func editButtonPressed(_ sender: Any) {
        vibration.impactOccurred()
        performSegue(withIdentifier: "EditAccount", sender: self)
    }
    
    @IBAction func primaryButtonPressed(_ sender: Any) {
        vibration.impactOccurred()
        
        for i in stride(from: 0, to: accounts.count, by: 1) {
            accounts[i].isMain = false
        }
        
        accounts[indexOfAccount].isMain = true
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        vibration.impactOccurred()
        
        let alert = UIAlertController(title: "Warning", message: "This account will be deleted!", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Delete", style: .destructive) { _ in
            accounts.remove(at: self.indexOfAccount)
            self.navigationController?.popViewController(animated: true)
        }
        let noButton = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addAction(noButton)
        alert.addAction(yesButton)
        
        present(alert, animated: true)
    }
    
}
