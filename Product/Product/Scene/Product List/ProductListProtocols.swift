//
//  ProductListProtocols.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

protocol ProductListViewToPresenter {
    var view: ProductListPresenterToView? {get set}
    var router: ProductListPresenterToRouter? {get set}
    var interactor: ProductListPresenterToInteractor? {get set}
    func routeToFilter(viewController: UIViewController)
    func doQueryProduct(payload: [String:Any])
}

protocol ProductListPresenterToView {
    func showSuccess(product: Product)
    func showError()
}

protocol ProductListPresenterToInteractor {
    var presenter: ProductListInteractorToPresenter? {get set}
    func requestProducts(payload: [String:Any])
}

protocol ProductListInteractorToPresenter {
    func requestProductsSuccess(product: Product)
    func requestProductsFailed()
}

protocol ProductListPresenterToRouter {
    func navigateToFilter(viewController: UIViewController)
}
