//
//  AppError.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 11/03/2021.
//

import Foundation

enum AppError: Error {
    case invalidURL
    case requestFailed
    case decodingFailure(_ error: Error)
    case noDataError
    case serverError(_ error: Error)
}
