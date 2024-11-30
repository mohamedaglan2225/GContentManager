//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//


import Foundation
import UIKit

public protocol FileSystemRepositoryProtocol {
    func createFolder(at path: String, named name: String) throws -> FileItem
    func moveItem(at sourcePath: String, to destinationPath: String) throws
    func copyItem(at sourcePath: String, to destinationPath: String) throws
    func deleteItem(at path: String, moveToTrash: Bool) throws
    func renameItem(at path: String, to newName: String) throws
    func getFileItem(at path: String) -> FileItem?
    func getFileItems(in directoryPath: String) -> [FileItem]
    func getSize(of fileItem: FileItem) -> Int64
    func emptyTrash() throws
    func scheduleAutoTrashDeletion()
}

public final class FileSystemRepository: FileSystemRepositoryProtocol {
    private let fileSystemService: FileSystemServiceProtocol
    private let fileMetadataService: FileMetadataServiceProtocol

    public init(fileSystemService: FileSystemServiceProtocol, fileMetadataService: FileMetadataServiceProtocol) {
        self.fileSystemService = fileSystemService
        self.fileMetadataService = fileMetadataService
    }

    public func createFolder(at path: String, named name: String) throws -> FileItem {
        try fileSystemService.createFolder(at: path, named: name)
        return getFileItem(at: (path as NSString).appendingPathComponent(name))!
    }

    public func moveItem(at sourcePath: String, to destinationPath: String) throws {
        try fileSystemService.moveItem(at: sourcePath, to: destinationPath)
    }

    public func copyItem(at sourcePath: String, to destinationPath: String) throws {
        try fileSystemService.copyItem(at: sourcePath, to: destinationPath)
    }

    public func deleteItem(at path: String, moveToTrash: Bool) throws {
        if moveToTrash {
            let trashPath = FileUtilities.trashDirectoryPath()
            let destinationPath = (trashPath as NSString).appendingPathComponent((path as NSString).lastPathComponent)
            try fileSystemService.moveItem(at: path, to: destinationPath)
        } else {
            try fileSystemService.deleteItem(at: path)
        }
    }

    public func renameItem(at path: String, to newName: String) throws {
        let parentPath = (path as NSString).deletingLastPathComponent as NSString
        let newPath = parentPath.appendingPathComponent(newName)
        try fileSystemService.moveItem(at: path, to: newPath)
    }


    public func getFileItem(at path: String) -> FileItem? {
        return fileMetadataService.getFileItem(at: path)
    }

    public func getFileItems(in directoryPath: String) -> [FileItem] {
        return fileMetadataService.getFileItems(in: directoryPath)
    }

    public func getSize(of fileItem: FileItem) -> Int64 {
        return fileMetadataService.getSize(of: fileItem)
    }

    public func emptyTrash() throws {
        let trashPath = FileUtilities.trashDirectoryPath()
        let fileItems = getFileItems(in: trashPath)
        for fileItem in fileItems {
            try fileSystemService.deleteItem(at: fileItem.path)
        }
    }

    public func scheduleAutoTrashDeletion() {
        // Implement scheduling logic, e.g., using a Timer or background task
    }
}
