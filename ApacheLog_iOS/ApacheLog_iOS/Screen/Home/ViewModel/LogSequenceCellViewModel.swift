//
//  LogSequenceCellViewModel.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 10/03/2021.
//

import Foundation

class LogSequenceCellViewModel {
    var sequence: LogSequence!
    var index: Int!
    
    init(sequence: LogSequence, index: Int) {
        self.sequence = sequence
        self.index = index
    }
    
    var threeGroupName: String {
        "\(sequence.threePage)"
    }
    
    var frequency: String {
        "\(sequence.frequency)"
    }
    
    var isEvenIndex: Bool {
        index%2 == 0
    }
}
