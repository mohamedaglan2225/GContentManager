//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import UIKit

extension String {
    public func sanitizedFileName() -> String {
        let invalidCharacters = CharacterSet(charactersIn: "/\\?%*|\"<>:")
        return self.components(separatedBy: invalidCharacters).joined(separator: "")
    }
}

