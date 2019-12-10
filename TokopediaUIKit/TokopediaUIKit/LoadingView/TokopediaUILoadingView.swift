//
//  TokopediaUILoadingView.swift
//  TokopediaUIKit
//
//  Created by Auzan Lazuardi on 06/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

public class TokopediaUILoadingView: UIView {
    let loadingContainerBox = UIView()
    let loadingIndicator = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    public override func layoutSubviews() {
        updateView()
    }
    
    func setupView() {
        loadingContainerBox.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingContainerBox.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
        loadingContainerBox.clipsToBounds = true
        loadingContainerBox.layer.cornerRadius = 10
        
        loadingIndicator.style = .whiteLarge
        loadingIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        loadingContainerBox.addSubview(loadingIndicator)
        
        self.addSubview(loadingContainerBox)
        loadingIndicator.startAnimating()
    }
    
    func updateView() {
        guard let superview = superview else {return}
        
        self.frame = superview.frame
        self.center = superview.center
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        
        loadingContainerBox.center = self.center
        loadingIndicator.center = CGPoint(x: loadingContainerBox.frame.size.width / 2,
                                          y: loadingContainerBox.frame.size.height / 2)
    }
    
    override public func willMove(toSuperview newSuperview: UIView?) {
        updateView()
    }
}
