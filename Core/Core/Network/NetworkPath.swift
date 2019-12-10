//
//  NetworkPath.swift
//  Core
//
//  Created by Auzan Lazuardi on 05/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation

class NetworkPath {
    class func createPath(_ service: NetworkService) -> String {
        switch service {
        case .healthCheck:
            return "product"
        case .getProducts:
            return "product"
        default:
            return "/"
        }
    }
}
