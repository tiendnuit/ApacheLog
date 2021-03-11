//
//  LogSequenceViewCell.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 10/03/2021.
//

import Foundation
import UIKit

class LogSequenceViewCell: UITableViewCell, Configurable {
    
    
    var groupsLabel: UILabel! = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.boldBody
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    
    var frequencyLabel: UILabel! = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.body
        label.textAlignment = .right
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupComponents() {
        contentView.addSubview(groupsLabel)
        contentView.addSubview(frequencyLabel)
        contentView.backgroundColor = .clear
        constraintsInit()
    }
    
    private func constraintsInit() {
        NSLayoutConstraint.activate([
            // groupsLabel
            groupsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            groupsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat.defaultComponentsSpacing),
            groupsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat.defaultSpacing),
            groupsLabel.rightAnchor.constraint(equalTo: frequencyLabel.leftAnchor, constant: CGFloat.defaultComponentsSpacing),
            
            
            //frequencyLabel
            frequencyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            frequencyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat.defaultComponentsSpacing),
            frequencyLabel.widthAnchor.constraint(equalToConstant: CGFloat.frequencyLabelWidth),
            frequencyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CGFloat.defaultSpacing),
            
        ])
    }
    
    func configure(_ item: Any) {
        guard let vm = item as? LogSequenceCellViewModel else { return }
        groupsLabel.text = vm.threeGroupName
        frequencyLabel.text = vm.frequency
        contentView.backgroundColor = vm.isEvenIndex ? .evenCellBackground : .oddCellBackground
    }
}
