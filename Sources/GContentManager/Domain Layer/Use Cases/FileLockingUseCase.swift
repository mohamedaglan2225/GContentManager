//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//


import Foundation

public protocol FileLockingUseCaseProtocol {
    func lockFileItem(_ fileItem: FileItem) throws
    func unlockFileItem(_ fileItem: FileItem, withPassword password: String) throws
    func isFileItemLocked(_ fileItem: FileItem) -> Bool
}

public final class FileLockingUseCase: FileLockingUseCaseProtocol {
    private let fileSecurityRepository: FileSecurityRepositoryProtocol

    public init(fileSecurityRepository: FileSecurityRepositoryProtocol) {
        self.fileSecurityRepository = fileSecurityRepository
    }

    public func lockFileItem(_ fileItem: FileItem) throws {
        try fileSecurityRepository.lockFileItem(fileItem)
    }

    public func unlockFileItem(_ fileItem: FileItem, withPassword password: String) throws {
        try fileSecurityRepository.unlockFileItem(fileItem, withPassword: password)
    }

    public func isFileItemLocked(_ fileItem: FileItem) -> Bool {
        return fileSecurityRepository.isFileItemLocked(fileItem)
    }
}
