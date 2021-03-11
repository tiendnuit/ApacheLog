//
//  LogInfo.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 10/03/2021.
//

import Foundation

struct LogInfo {
    static let pattern = "^(\\S+) (\\S+) (\\S+) \\[([\\w:/]+\\s[+-]\\d{4})\\] \"(\\S+)\\s?(\\S+)?\\s?(\\S+)?\" (\\d{3}) (\\d+) \"([^\"]+)\" \"(.+?)\""
    let user: String
    let requestedPage: String
    
    init(user: String, requestedPage: String) {
        self.user = user
        self.requestedPage = requestedPage
    }
    
    init(log: String) {
        let groups = log.groups(for: LogInfo.pattern)
        user = groups.first![1]
        requestedPage = groups.first![6]
    }
    
    static func isValidPattern(_ log: String) -> Bool {
        return log.isMatch(for: LogInfo.pattern)
    }
}
