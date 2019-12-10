//
//  ProductListAdapter.swift
//  Product
//
//  Created by Auzan Lazuardi on 01/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

class ProductListAdapter: NSObject {
    fileprivate let cellNib = String(describing: ProductCell.self)
    
    init(forCollection collection: UICollectionView) {
        collection.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: cellNib)
    }
}

extension ProductListAdapter: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellNib, for: indexPath) as! ProductCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
