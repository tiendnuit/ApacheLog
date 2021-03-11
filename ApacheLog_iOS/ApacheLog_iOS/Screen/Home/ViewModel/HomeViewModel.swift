//
//  HomeViewModel.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 10/03/2021.
//

import Foundation
import Combine

enum ViewModelState {
    case none
    case stop
    case loading
    case error(Error)
}

class HomeViewModel {
    @Published private(set) var sequences: [LogSequence] = []
    @Published private(set) var state: ViewModelState = .none
    fileprivate var bindings = Set<AnyCancellable>()
    
    /// download Log File
    func downloadLogFile() {
        guard let url = API.apacheLog.urlRequest.url else {
            state = .error(AppError.invalidURL)
            return
        }
        state = .loading
        DispatchQueue.global().async {
            if let string = try? String(contentsOf: url) {
                DispatchQueue.main.async {
                    let lines = string.components(separatedBy: "\n").map{String($0)}
                    let logInfos = lines.filter{LogInfo.isValidPattern($0)}.map{LogInfo(log: $0)}
                    self.processThreePageSequences(logInfos)
                }
                
            } else {
                self.state = .error(AppError.noDataError)
            }
        }
        
    }
    
    func processThreePageSequences(_ logInfos: [LogInfo]) {
        var dict: [String: LogSequence] = [:]
        let groupByUser = Dictionary(grouping: logInfos) {$0.user}.values
        let sequenceSize = 2
        for logs in groupByUser {
            var index = 0
            while index < logs.count - sequenceSize {
                let key = Array(logs[index...index+sequenceSize]).map{$0.requestedPage}.joined(separator: ", ")
                let sequence = dict[key] ?? LogSequence(threePage: key)
                dict[key] = sequence.increaseFrequency()
                index += 1
            }
        }
        
        state = .stop
        sequences = dict.values.sorted(by: {$0.frequency > $1.frequency})
    }
    
}

extension HomeViewModel: ListLogSequenceProtocol {
    var items: [LogSequenceCellViewModel] {
        return sequences
            .enumerated()
            .map{LogSequenceCellViewModel(sequence: $1, index: $0)}
    }
}
