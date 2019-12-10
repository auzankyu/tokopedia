//
//  ProductListModel.swift
//  Product
//
//  Created by Auzan Lazuardi on 03/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import Mapper

class Product: Mappable {
    let status: Status?
    let data: [Datas]?
    
    required init(map: Mapper) throws {
        self.status = map.optionalFrom("status")
        self.data = map.optionalFrom("data")
    }
}

struct Status: Mappable {
    let errorCode: String?
    let message: String?
    
    init(map: Mapper) throws {
        self.errorCode = map.optionalFrom("error_code")
        self.message = map.optionalFrom("message")
    }
}

struct Datas: Mappable {
    let id: String?
    let name: String?
    let price: String?
    let image: String?
    
    init(map: Mapper) throws {
        self.id = map.optionalFrom("id")
        self.name = map.optionalFrom("name")
        self.price = map.optionalFrom("price")
        self.image = map.optionalFrom("image_uri")
        
    }
}
