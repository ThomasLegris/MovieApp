//
//  MError.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 20/12/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import shared

enum MErrorType: Identifiable {
    case noData
    case serverError
    case defaultError(Error)
    
    var title: String {
        switch self {
        case .noData:
            return "Aucune donnée disponible"
        case .serverError:
            return "Problème serveur detecté"
        case .defaultError(let nsError):
            return nsError.localizedDescription
        }
    }
    
    var id: String {
        switch self {
        case .noData:
            return "serverError"
        case .serverError:
            return "serverError"
        case .defaultError:
            return "defaultError"
        }
    }
}

struct ApiError {
    var error: Error
    
    var type: MErrorType {
        if let error = error as? NSError {
            switch error.kotlinException {
            case let httpException as Ktor_client_coreResponseException:
                switch httpException.response.status.value {
                case 400...499:
                    return .noData
                case 500...599:
                    return .serverError
                default:
                    return .defaultError(error)
                }
            case let illegalStateException as KotlinIllegalStateException:
                return .defaultError(error)
            default:
                return .defaultError(error)
            }
        }
        return .defaultError(error)
    }
}
