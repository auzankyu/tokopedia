//
//  NetworkTask.swift
//  Core
//
//  Created by Auzan Lazuardi on 05/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import Moya

class NetworkTask {
    class func createParams(_ service: NetworkService) -> Task {
        switch service {
        case .healthCheck:
            return .requestPlain
        case .getProducts(let payloads):
            print("Disini \(payloads["wholesale"]!)")
            let wholesale = (payloads["wholesale"]! as? Bool) == true ? "true" : "false"
            let official = (payloads["official"]! as? Bool) == true ? "true" : "false"
            let body: [String:Any] = [
                "q": payloads["q"]!,
                "pmin": payloads["pmin"]!,
                "pmax": payloads["pmax"]!,
                "wholesale": wholesale,
                "official": official,
                "fshop": payloads["fshop"]!,
                "start": payloads["start"]!,
                "rows": payloads["rows"]!
            ]
            return .requestParameters(parameters: body, encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
}
