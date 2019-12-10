//
//  FilterRouter.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit
import Navigations

class FilterRouter: FilterPresenterToRouter {
    
    func navigateToCategory(viewController: UIViewController, object: [Category]) {
        let module = Navigation.shared.productListModule
        let screen = module.categoryScreen(object: object)
        viewController.navigationController?.pushViewController(screen, animated: true)
    }
    
    func navigateToCategory(viewController: UIViewController) {
        let module = Navigation.shared.productListModule
        let screen = module.categoryScreen()
        viewController.navigationController?.pushViewController(screen, animated: true)
    }
    
    func navigateToProductList(viewController: UIViewController, object: [String : Any]) {
        let module = Navigation.shared.productListModule
        let screen = module.productListScreen(object: object)
        viewController.navigationController?.pushViewController(screen, animated: true)
    }
    
    func navigateToPrev(viewController: UIViewController) {
        let module = Navigation.shared.productListModule
        let screen = module.productListScreen()
        viewController.navigationController?.pushViewController(screen, animated: true)
    }
}
