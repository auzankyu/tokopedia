//
//  CategoryPresenter.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

class CategoryPresenter: CategoryViewToPresenter {
    var router: CategoryPresenterToRouter?
    
    func routeToFilter(viewController: UIViewController, object: [Category]) {
        router?.navigateToFilter(viewController: viewController, object: object)
    }
    
    func routeToPrev(viewController: UIViewController) {
        router?.navigateToPrev(viewController: viewController)
    }
}
