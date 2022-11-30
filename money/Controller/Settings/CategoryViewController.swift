//
//  CategoryViewController.swift
//  money
//
//  Created by User on 01.12.2022.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let data = ["square.and.arrow.up", "square.and.arrow.up.circle", "square.and.arrow.down"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IconReusableCell")

        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension CategoryViewController: UICollectionViewDelegate {
    
}

extension CategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconReusableCell", for: indexPath) as! IconCollectionViewCell
        
        cell.iconImage.image = UIImage(systemName: data[indexPath.row])
        
        return cell
    }
    
}
