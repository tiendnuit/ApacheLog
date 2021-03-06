//
//  String+Regex.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 11/03/2021.
//

import Foundation
extension String {
    
    func isMatch(for pattern: String) -> Bool {
        let patternCheck = NSPredicate(format: "SELF MATCHES %@", pattern)
        return patternCheck.evaluate(with: self)
    }
    
    func groups(for pattern: String) -> [[String]] {
        do {
            let text = self
            let regex = try NSRegularExpression(pattern: pattern)
            let matches = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return matches.map { match in
                return (0..<match.numberOfRanges).map {
                    let rangeBounds = match.range(at: $0)
                    guard let range = Range(rangeBounds, in: text) else {
                        return ""
                    }
                    return String(text[range])
                }
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
