//
//  TokopediaNumber.swift
//  TokopediaUIKit
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation

public class TokopediaNumber {
    public static let shared = TokopediaNumber()
    
    public func formatNumber(value: Int) -> String {
        let number = NumberFormatter()
        number.numberStyle = .decimal
        number.groupingSeparator = "."
        let formattedNumber = number.string(from: NSNumber(value: value))
        return formattedNumber!
    }
}
