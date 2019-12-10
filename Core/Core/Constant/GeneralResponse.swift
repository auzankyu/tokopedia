//
//  GeneralResponse.swift
//  Core
//
//  Created by Auzan Lazuardi on 05/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation

public enum GeneralResponse: Swift.Error, LocalizedError {
    case genericError(message: String)
    case serverError
    case dataNotFound
    case dataAlreadyExists

    public var errorDescription: String? {
        switch self {
        case .serverError:
            return "Server Error"
        case .genericError(let message):
            return message
        case .dataNotFound:
            return "Data Not Found"
        case .dataAlreadyExists:
            return "Data Already Exists"
        }
    }
}

public enum AlertResponse: LocalizedError {
    case connectionError

    public var errorTitle: String? {
        switch self {
        case .connectionError:
            return "Koneksi gagal"
        }
    }

    public var errorMessage: String? {
        switch self {
         case .connectionError:
            return "Gagal terhubung dengan server"
        }
    }
    public static let errorButton = "OK"
}
