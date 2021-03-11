//
//  UIFont+Utils.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 10/03/2021.
//

import Foundation

import UIKit
// MARK: - Font

extension UIFont {

    /// Title label font
    public static var title: UIFont = UIFont.boldSystemFont(ofSize: 20)

    /// Body  label
    public static var body: UIFont = UIFont.systemFont(ofSize: 16)
    
    /// Bold body label
    public static var boldBody: UIFont = UIFont.boldSystemFont(ofSize: 16)
    
    /// Sub label
    public static var subText: UIFont = UIFont.systemFont(ofSize: 12)
    
    /// bold Sub label
    public static var boldSubText: UIFont = UIFont.boldSystemFont(ofSize: 12)

}
