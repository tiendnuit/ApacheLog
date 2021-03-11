//
//  LogSequence.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 10/03/2021.
//

import Foundation

struct LogSequence {
    let threePage: String
    var frequency: Int = 0
    
    func increaseFrequency() -> LogSequence {
        return LogSequence(threePage: threePage, frequency: frequency + 1)
    }
}
