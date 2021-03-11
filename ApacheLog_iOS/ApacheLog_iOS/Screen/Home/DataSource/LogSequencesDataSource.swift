//
//  LogSequencesDataSource.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 10/03/2021.
//

import Foundation
import UIKit

class LogSequencesDataSource: NSObject {
    weak var delegate: ListLogSequenceProtocol?
    
    init(delegate: ListLogSequenceProtocol?) {
        self.delegate = delegate
    }
}


// MARK: - UITableViewDataSource & UITableViewDelegate
extension LogSequencesDataSource: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = delegate?.item(at: indexPath) else {
            fatalError("Item not exists")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LogSequenceViewCell.typeName, for: indexPath) as! LogSequenceViewCell
        cell.selectionStyle = .none
        cell.configure(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
