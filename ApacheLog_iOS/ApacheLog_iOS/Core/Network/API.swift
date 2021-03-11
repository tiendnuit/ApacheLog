//
//  API.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 11/03/2021.
//

import Foundation
enum API {
    case apacheLog
}

extension API: Endpoint {
    var baseURL: String {
        return ApiConfig.defaultConfig.apiEnvironment.apiURL
    }
    
    var path: String {
        switch self {
        case .apacheLog:
            return "/IAChallenge/30E02AAA-B947-4D4B-8FB6-9C57C43872A9/Apache.log"
        }
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var headers: [String: Any]? {
        return nil
    }
    
    var method: ServiceMethod {
        return .get
    }
    
    //Mock data
    var mockData: Data? {
        return nil
    }
    
    
}
