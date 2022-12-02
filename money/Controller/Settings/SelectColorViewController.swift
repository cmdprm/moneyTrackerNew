//
//  SelectColorViewController.swift
//  money
//
//  Created by User on 03.12.2022.
//

import UIKit

protocol SelectColorDelegate {
    func transferColorIndex(index: Int)
}

class SelectColorViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: SelectColorDelegate?
    var colorIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "ColorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColorReusableCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension SelectColorViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.colorIndex = indexPath.row
        delegate?.transferColorIndex(index: self.colorIndex!)
        self.navigationController?.popViewController(animated: true)
    }
}

extension SelectColorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorReusableCell", for: indexPath) as! ColorCollectionViewCell
        
        cell.colorView.backgroundColor = colors[indexPath.row]
        
        return cell
    }
    
    
}
