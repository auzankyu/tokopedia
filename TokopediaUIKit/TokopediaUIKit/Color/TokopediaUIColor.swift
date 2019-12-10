//
//  TokopediaUIColor.swift
//  TokopediaUIKit
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

public class TokopediaUIColor {
    public static let shared = TokopediaUIColor()
    
    public func color(of colorOption: TokopediaUIColorOption) -> UIColor {
        return UIColor.fromHex(hex: colorOption.rawValue)
    }
}
