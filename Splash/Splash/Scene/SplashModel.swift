//
//  SplashModel.swift
//  Splash
//
//  Created by Auzan Lazuardi on 10/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import Mapper

class Health: Mappable {
    let status: Status?
    
    required init(map: Mapper) throws {
        self.status = map.optionalFrom("status")
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

