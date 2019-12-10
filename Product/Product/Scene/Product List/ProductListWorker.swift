//
//  ProductListWorker.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import Core
import RxSwift
import Mapper
import Moya_ModelMapper

class ProductListWorker {
    func fetchProducts(payload: [String:Any]) -> Single<Product> {
        return coreProvider.rx.request(.getProducts(payloads: payload))
            .map { moyaResponse -> Product in
                if moyaResponse.statusCode == 200 {
                    return try moyaResponse.map(to: Product.self)
                } else {
                    throw GeneralResponse.genericError(message: moyaResponse.description)
                }
        }
    }
}
