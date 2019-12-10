//
//  CategoryRouter.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit
import Navigations

class CategoryRouter: CategoryPresenterToRouter {
    
    func navigateToFilter(viewController: UIViewController, object: [Category]) {
        let module = Navigation.shared.productListModule
        let screen = module.filterScreen(object: object)
        viewController.navigationController?.pushViewController(screen, animated: true)
    }
    
    func navigateToPrev(viewController: UIViewController) {
        let module = Navigation.shared.productListModule
        let screen = module.filterScreen()
        viewController.navigationController?.pushViewController(screen, animated: true)
    }
}
