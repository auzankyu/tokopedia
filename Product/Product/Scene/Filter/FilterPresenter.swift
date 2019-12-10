//
//  FilterPresenter.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

class FilterPresenter: FilterViewToPresenter {
    var router: FilterPresenterToRouter?
    
    func routeToCategory(viewController: UIViewController, object: [Category]) {
        router?.navigateToCategory(viewController: viewController, object: object )
    }
    
    func routeToCategory(viewController: UIViewController) {
        router?.navigateToCategory(viewController: viewController)
    }
    
    func routeToProductList(viewController: UIViewController, object: [String : Any]) {
        router?.navigateToProductList(viewController: viewController, object: object)
    }
    
    func routeToPrev(viewController: UIViewController) {
        router?.navigateToPrev(viewController: viewController)
    }
}
