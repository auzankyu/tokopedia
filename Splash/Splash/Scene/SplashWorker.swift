//
//  SplashWorker.swift
//  Splash
//
//  Created by Auzan Lazuardi on 10/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import Core
import RxSwift
import Mapper
import Moya_ModelMapper

class SplashWorker {
    func fetchHealthCheck() -> Single<Health> {
        return coreProvider.rx.request(.healthCheck)
            .map { (moyaResponse) -> Health in
                if moyaResponse.statusCode == 200 {
                    return try moyaResponse.map(to: Health.self)
                } else {
                    throw GeneralResponse.genericError(message: moyaResponse.description)
                }
        }
    }
}
