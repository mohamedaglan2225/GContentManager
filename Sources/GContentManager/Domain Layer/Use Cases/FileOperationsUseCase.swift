//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//


import Foundation

public protocol FileOperationsUseCaseProtocol {
    func createFolder(at path: String, named name: String) throws -> FileItem
    func moveItem(at sourcePath: String, to destinationPath: String) throws
    func copyItem(at sourcePath: String, to destinationPath: String) throws
    func deleteItem(at path: String, moveToTrash: Bool) throws
    func renameItem(at path: String, to newName: String) throws
}

public final class FileOperationsUseCase: FileOperationsUseCaseProtocol {
    private let fileSystemRepository: FileSystemRepositoryProtocol

    public init(fileSystemRepository: FileSystemRepositoryProtocol) {
        self.fileSystemRepository = fileSystemRepository
    }

    public func createFolder(at path: String, named name: String) throws -> FileItem {
        return try fileSystemRepository.createFolder(at: path, named: name)
    }

    public func moveItem(at sourcePath: String, to destinationPath: String) throws {
        try fileSystemRepository.moveItem(at: sourcePath, to: destinationPath)
    }

    public func copyItem(at sourcePath: String, to destinationPath: String) throws {
        try fileSystemRepository.copyItem(at: sourcePath, to: destinationPath)
    }

    public func deleteItem(at path: String, moveToTrash: Bool) throws {
        try fileSystemRepository.deleteItem(at: path, moveToTrash: moveToTrash)
    }

    public func renameItem(at path: String, to newName: String) throws {
        try fileSystemRepository.renameItem(at: path, to: newName)
    }
}
