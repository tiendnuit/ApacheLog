//
//  ListLogSequenceProtocol.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 10/03/2021.
//

import Foundation
protocol ListLogSequenceProtocol: class {
    var items: [LogSequenceCellViewModel] {get}
    func numberOfItems() -> Int
    func item(at indexPath: IndexPath) -> LogSequenceCellViewModel?
    func itemSelected(at: IndexPath)
}

extension ListLogSequenceProtocol {
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(at indexPath: IndexPath) -> LogSequenceCellViewModel? {
        guard indexPath.row < items.count else { return nil }
        return items[indexPath.row]
    }
    
    func itemSelected(at indexPath: IndexPath) {
        // selected Item
    }
}
