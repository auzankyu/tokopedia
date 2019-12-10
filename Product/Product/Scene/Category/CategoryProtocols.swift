//
//  CategoryProtocols.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

protocol CategoryViewToPresenter {
    var router: CategoryPresenterToRouter? {get set}
    
    func routeToFilter(viewController: UIViewController, object: [Category])
    func routeToPrev(viewController: UIViewController)
}

protocol CategoryPresenterToRouter {
    func navigateToFilter(viewController: UIViewController, object: [Category]) 
    func navigateToPrev(viewController: UIViewController)
}
