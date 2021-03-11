//
//  Coordinator.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 11/03/2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
