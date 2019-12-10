//
//  FilterProtocols.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

protocol FilterViewToPresenter {
    var router: FilterPresenterToRouter? {get set}
    
    func routeToCategory(viewController: UIViewController, object: [Category])
    func routeToCategory(viewController: UIViewController)
    func routeToProductList(viewController: UIViewController, object: [String:Any])
    func routeToPrev(viewController: UIViewController)
}

protocol FilterPresenterToRouter {
    func navigateToCategory(viewController: UIViewController, object: [Category])
    func navigateToCategory(viewController: UIViewController)
    func navigateToProductList(viewController: UIViewController, object: [String:Any])
    func navigateToPrev(viewController: UIViewController)
}
