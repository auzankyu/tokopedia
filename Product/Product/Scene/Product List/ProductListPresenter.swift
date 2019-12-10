//
//  ProductListPresenter.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

class ProductListPresenter: ProductListViewToPresenter {
    var view: ProductListPresenterToView?
    var router: ProductListPresenterToRouter?
    var interactor: ProductListPresenterToInteractor?
    
    func routeToFilter(viewController: UIViewController) {
        router?.navigateToFilter(viewController: viewController)
    }
    
    func doQueryProduct(payload: [String : Any]) {
        interactor?.requestProducts(payload: payload)
    }
    
}

extension ProductListPresenter: ProductListInteractorToPresenter {
    func requestProductsSuccess(product: Product) {
        view?.showSuccess(product: product)
    }
    
    func requestProductsFailed() {
        view?.showError()
    }
}
