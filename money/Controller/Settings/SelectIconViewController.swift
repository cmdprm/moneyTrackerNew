//
//  SelectIconViewController.swift
//  money
//
//  Created by User on 03.12.2022.
//

import UIKit

protocol SelectIconDelegate {
    func transferIconIndex(index: Int)
}

class SelectIconViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: SelectIconDelegate?
    var iconIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IconReusableCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension SelectIconViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.iconIndex = indexPath.row
        delegate?.transferIconIndex(index: self.iconIndex!)
        self.navigationController?.popViewController(animated: true)
    }
}

extension SelectIconViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconReusableCell", for: indexPath) as! IconCollectionViewCell
        
        cell.iconView.backgroundColor = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1.00)
        cell.iconImage.tintColor = .black
        cell.iconImage.image = UIImage(systemName: icons[indexPath.row])
        
        return cell
    }
    
    
}
