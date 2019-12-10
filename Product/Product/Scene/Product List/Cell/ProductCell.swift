//
//  ProductCell.swift
//  Product
//
//  Created by Auzan Lazuardi on 01/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import UIKit
import TokopediaUIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLayout()
    }
    
    func setupLayout() {
        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor.black
        priceLabel.textColor = TokopediaUIColor.shared.color(of: .price)
        
        productImage.layer.cornerRadius = 10
        productImage.clipsToBounds = true
        productImage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        productView.layer.cornerRadius = 10
        productView.layer.masksToBounds = false
        productView.layer.shadowOpacity = 0.2
        productView.layer.shadowColor = UIColor.black.cgColor
        productView.layer.shadowOffset = CGSize(width: 0, height: 1)
        productView.layer.shadowRadius = 4
    }
    
}
