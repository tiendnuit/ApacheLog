//
//  ApiConfig.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 11/03/2021.
//

import Foundation
enum APIEnvironment: String {
    case dev = "dev"
    case prod = "prod"
    
    var apiURL: String {
        switch self {
        case .dev:
            return "https://files.inspiringapps.com"
        case .prod:
            return "https://files.inspiringapps.com"
        }
    }
    
}
struct ApiConfig {
    static var defaultConfig = ApiConfig()
    let apiEnvironment = APIEnvironment(rawValue: Bundle.main.infoDictionary![Constants.ApiConfig.enviroment] as! String)!
}

extension Constants {
    struct ApiConfig {
        static let enviroment = "APIEnvironment"
    }
}
