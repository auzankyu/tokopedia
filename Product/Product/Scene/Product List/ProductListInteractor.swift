//
//  ProductListInteractor.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import RxSwift

class ProductListInteractor: ProductListPresenterToInteractor {
    var presenter: ProductListInteractorToPresenter?
    var worker: ProductListWorker?
    
    func requestProducts(payload: [String : Any]) {
        worker = ProductListWorker()
        worker?.fetchProducts(payload: payload)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { (result) in
                self.presenter?.requestProductsSuccess(product: result)
            }, onError: { (_) in
                self.presenter?.requestProductsFailed()
            })
    }
}
