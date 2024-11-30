//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation

public protocol FileSystemServiceProtocol {
    func createFolder(at path: String, named name: String) throws
    func moveItem(at sourcePath: String, to destinationPath: String) throws
    func copyItem(at sourcePath: String, to destinationPath: String) throws
    func deleteItem(at path: String) throws
}

public final class FileSystemService: FileSystemServiceProtocol {
    private let fileManager: FileManager

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    public func createFolder(at path: String, named name: String) throws {
        let folderPath = (path as NSString).appendingPathComponent(name)
        try fileManager.createDirectory(atPath: folderPath, withIntermediateDirectories: true, attributes: nil)
    }

    public func moveItem(at sourcePath: String, to destinationPath: String) throws {
        try fileManager.moveItem(atPath: sourcePath, toPath: destinationPath)
    }

    public func copyItem(at sourcePath: String, to destinationPath: String) throws {
        try fileManager.copyItem(atPath: sourcePath, toPath: destinationPath)
    }

    public func deleteItem(at path: String) throws {
        try fileManager.removeItem(atPath: path)
    }
}

