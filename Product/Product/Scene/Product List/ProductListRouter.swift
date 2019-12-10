//
//  ProductListRouter.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit
import Navigations

class ProductListRouter: ProductListPresenterToRouter {
    
    func navigateToFilter(viewController: UIViewController) {
        let module = Navigation.shared.productListModule
        let screen = module.filterScreen()
        viewController.navigationController?.pushViewController(screen, animated: true)
    }
}
