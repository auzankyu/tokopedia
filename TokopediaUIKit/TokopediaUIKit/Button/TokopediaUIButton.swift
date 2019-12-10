//
//  TokopediaUIButton.swift
//  TokopediaUIKit
//
//  Created by Auzan Lazuardi on 02/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import UIKit

@IBDesignable public class TokopediaUIButton: UIButton {
    
    @IBInspectable var buttonStyle: Int {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var buttonShape: Int {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override func layoutSubviews() {
        setButtonStyle()
        super.layoutSubviews()
    }
    
    public override init(frame: CGRect) {
        self.buttonStyle = TokopediaUIButtonStyle.green.rawValue
        self.buttonShape = TokopediaUIButtonShape.standard.rawValue
        super.init(frame: frame)
        setButtonStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.buttonStyle = TokopediaUIButtonStyle.green.rawValue
        self.buttonShape = TokopediaUIButtonShape.standard.rawValue
        super.init(coder: aDecoder)
    }
    
    //MARK: initialize
    public init(frame: CGRect, buttonStyle: TokopediaUIButtonStyle, buttonShape: TokopediaUIButtonShape) {
        self.buttonStyle = buttonStyle.rawValue
        self.buttonShape = buttonShape.rawValue
        super.init(frame: frame)
        setButtonStyle()
    }
    
    public init(buttonStyle: TokopediaUIButtonStyle, buttonShape: TokopediaUIButtonShape) {
        self.buttonStyle = buttonStyle.rawValue
        self.buttonShape = buttonShape.rawValue
        super.init(frame: .zero)
        setButtonStyle()
    }
    
    func implementButtonStyle(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.setTitleColor(textColor, for: .normal)
        self.alpha = isEnabled ? 1.0 : 0.5
    }
    
    func setButtonStyle() {
        if let buttonStyle = TokopediaUIButtonStyle(rawValue: self.buttonStyle) {
            switch buttonStyle {
            case .green:
                implementButtonStyle(backgroundColor: UIColor.fromHex(hex: "#27ae60"), textColor: UIColor.fromHex(hex: "#ffffff"))
                break
            case .classic:
                implementButtonStyle(backgroundColor: UIColor.fromHex(hex: "#ffffff"), textColor: UIColor.fromHex(hex: "#000000"))
                break
            }
        } else {
            implementButtonStyle(backgroundColor: .gray, textColor: .black)
        }
        setButtonShape()
    }
    
    func setButtonShape() {
        if let buttonShape = TokopediaUIButtonShape(rawValue: self.buttonShape) {
            switch buttonShape {
            case .standard:
                self.layer.cornerRadius = 0
                break
            case .rounded:
                self.layer.cornerRadius = 5
                self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                self.layer.masksToBounds = false
                self.layer.shadowOpacity = 0.2
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOffset = CGSize(width: 0, height: 1)
                self.layer.shadowRadius = 4
                break
            }
        } else {
            self.layer.cornerRadius = 0
        }
    }
}
