//
//  ProductModule.swift
//  Product
//
//  Created by Auzan Lazuardi on 01/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit
import Navigations

public class ProductModule: ProductModuleProtocol {
    public init() {}
    
    public func productListScreen() -> UIViewController {
        return ProductListVC()
    }
    
    public func productListScreen(object: [String:Any]) -> UIViewController {
        return ProductListVC(object: object)
    }
    
    public func filterScreen(object: [Any]) -> UIViewController {
        let filterVC = FilterVC()
        if let category = object as? [Category] {
            filterVC.category = category
        }
        return filterVC
    }
    
    public func filterScreen() -> UIViewController {
        return FilterVC()
    }
    
    public func categoryScreen(object: [Any]) -> UIViewController {
        let categoryVC = CategoryVC()
        if let category = object as? [Category] {
            categoryVC.category = category
        }
        return categoryVC
    }
    
    public func categoryScreen() -> UIViewController {
        return CategoryVC()
    }
}
