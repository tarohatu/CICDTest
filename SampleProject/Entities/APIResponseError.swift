//
//  APIResponseError.swift
//  SampleProject
//
//  Created by Takuya Jimbo on 2021/03/24.
//  Copyright © 2021 Takuya Jimbo. All rights reserved.
//

import Foundation
import Himotoki

enum APIResponseError: Error {
    case failedResponse(error: String)
    case invalidRequest
    case notFound
    case methodNotAllowed
    case requestToLarge
    case internalServerError
}

extension APIResponseError: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .failedResponse(let error):
            return NSLocalizedString(
                error,
                tableName: "error",
                value: error,
                comment: "API エラー"
            )
        case .invalidRequest:
            return "400"
        case .notFound:
            return "404"
        case .methodNotAllowed:
            return "403"
        case .requestToLarge:
            return "429"
        case .internalServerError:
            return "500"
        }
    }
}

extension APIResponseError: LocalizedError {
    
    var errorDescription: String? {
        return description
    }
}

extension APIResponseError: Himotoki.Decodable {
    
    static func decode(_ extractor: Extractor) throws -> APIResponseError {
        return try APIResponseError.failedResponse(error: extractor <| ["error", "message"])
    }
}
