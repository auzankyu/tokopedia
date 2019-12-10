//
//  Product.swift
//  Navigations
//
//  Created by Auzan Lazuardi on 01/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

public protocol ProductModuleProtocol {
    func productListScreen() -> UIViewController
    func productListScreen(object: [String:Any]) -> UIViewController
    func filterScreen(object: [Any]) -> UIViewController
    func filterScreen() -> UIViewController
    func categoryScreen(object: [Any]) -> UIViewController
    func categoryScreen() -> UIViewController
}

extension Navigation {
    public var productListModule: ProductModuleProtocol {
        return resolve(ProductModuleProtocol.self)!
    }
}
