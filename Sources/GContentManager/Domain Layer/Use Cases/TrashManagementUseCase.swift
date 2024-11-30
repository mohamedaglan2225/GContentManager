//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation

public protocol TrashManagementUseCaseProtocol {
    func emptyTrash() throws
    func restoreItem(fromTrash path: String, to destinationPath: String) throws
    func scheduleAutoTrashDeletion()
}

public final class TrashManagementUseCase: TrashManagementUseCaseProtocol {
    private let fileSystemRepository: FileSystemRepositoryProtocol

    public init(fileSystemRepository: FileSystemRepositoryProtocol) {
        self.fileSystemRepository = fileSystemRepository
    }

    public func emptyTrash() throws {
        try fileSystemRepository.emptyTrash()
    }

    public func restoreItem(fromTrash path: String, to destinationPath: String) throws {
        try fileSystemRepository.moveItem(at: path, to: destinationPath)
    }

    public func scheduleAutoTrashDeletion() {
        fileSystemRepository.scheduleAutoTrashDeletion()
    }
}

