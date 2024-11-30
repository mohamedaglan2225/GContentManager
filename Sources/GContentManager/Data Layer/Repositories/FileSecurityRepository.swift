//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation

public protocol FileSecurityRepositoryProtocol {
    func lockFileItem(_ fileItem: FileItem) throws
    func unlockFileItem(_ fileItem: FileItem, withPassword password: String) throws
    func isFileItemLocked(_ fileItem: FileItem) -> Bool
}

public final class FileSecurityRepository: FileSecurityRepositoryProtocol {
    
    public init() {
       
    }
    
    private var lockedFileItems: Set<Int> = []
    private var fileItemPasswords: [Int: String] = [:]

    public func lockFileItem(_ fileItem: FileItem) throws {
        // Implement locking logic
        lockedFileItems.insert(fileItem.id)
        fileItemPasswords[fileItem.id] = "password" // Replace with actual password handling
    }

    public func unlockFileItem(_ fileItem: FileItem, withPassword password: String) throws {
        guard let storedPassword = fileItemPasswords[fileItem.id], storedPassword == password else {
            throw NSError(domain: "Security", code: 401, userInfo: [NSLocalizedDescriptionKey: "Incorrect password"])
        }
        lockedFileItems.remove(fileItem.id)
    }

    public func isFileItemLocked(_ fileItem: FileItem) -> Bool {
        return lockedFileItems.contains(fileItem.id)
    }
}

