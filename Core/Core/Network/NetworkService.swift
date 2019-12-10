//
//  NetworkService.swift
//  Core
//
//  Created by Auzan Lazuardi on 05/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import Moya
import Mapper
import RxSwift
import Result

public let coreProvider = MoyaProvider<NetworkService>(plugins:[HandlingResponsePlugin(),
                                                                    NetworkLoggerPlugin(verbose: true)])

public enum NetworkService {
    case healthCheck
    case getProducts(payloads: [String:Any])
}

extension NetworkService: TargetType {
    public var baseURL: URL {
        return URL(string: Constant.baseURL)!
    }

    public var path: String {
        return NetworkPath.createPath(self)
    }

    public var method: Moya.Method {
        switch self {
        case .healthCheck,
             .getProducts:
            return .get
        default :
            return .post
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        return NetworkTask.createParams(self)
    }

    public var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}

class HandlingResponsePlugin: PluginType {
    public func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        if let statusCode = try? result.get().statusCode {
            if statusCode != 200 {
                let erroDict = [Constant.errorKey: result.error?.errorDescription]
                NotificationCenter.default.post(name: NSNotification.Name("error"), object: nil, userInfo: erroDict as [AnyHashable: Any])
            }
        }
        return result
    }
}
