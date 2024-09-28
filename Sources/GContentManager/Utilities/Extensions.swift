//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//


import Foundation

// MARK: - String Extensions

public extension String {
    var fileExtension: String {
        return (self as NSString).pathExtension
    }

    func deletingFileExtension() -> String {
        return (self as NSString).deletingPathExtension
    }

    func appendingPathComponent(_ path: String) -> String {
        return (self as NSString).appendingPathComponent(path)
    }
}
