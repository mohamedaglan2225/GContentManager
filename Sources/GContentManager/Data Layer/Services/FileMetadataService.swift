//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation

public protocol FileMetadataServiceProtocol {
    func getFileItem(at path: String) -> FileItem?
    func getFileItems(in directoryPath: String) -> [FileItem]
    func getSize(of fileItem: FileItem) -> Int64
}

public final class FileMetadataService: FileMetadataServiceProtocol {
    private let fileManager: FileManager

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    public func getFileItem(at path: String) -> FileItem? {
        var isDir: ObjCBool = false
        guard fileManager.fileExists(atPath: path, isDirectory: &isDir) else {
            return nil
        }
        do {
            let attributes = try fileManager.attributesOfItem(atPath: path)
            let size = attributes[.size] as? Int64 ?? 0
            let creationDate = attributes[.creationDate] as? Date ?? Date()
            let modificationDate = attributes[.modificationDate] as? Date ?? Date()
            let id = attributes[.systemFileNumber] as? Int ?? -1
            let name = (path as NSString).lastPathComponent
            let type: FileType = isDir.boolValue ? .folder : FileType.type(for: (name as NSString).pathExtension)
            return FileItem(
                id: id,
                name: name,
                path: path,
                type: type,
                size: size,
                creationDate: creationDate,
                modificationDate: modificationDate
            )
        } catch {
            return nil
        }
    }

    public func getFileItems(in directoryPath: String) -> [FileItem] {
        do {
            let items = try fileManager.contentsOfDirectory(atPath: directoryPath)
            return items.compactMap { item in
                let fullPath = (directoryPath as NSString).appendingPathComponent(item)
                return getFileItem(at: fullPath)
            }
        } catch {
            return []
        }
    }

    public func getSize(of fileItem: FileItem) -> Int64 {
        if fileItem.type == .folder {
            let contents = getFileItems(in: fileItem.path)
            return contents.reduce(0) { $0 + getSize(of: $1) }
        } else {
            return fileItem.size
        }
    }
}

