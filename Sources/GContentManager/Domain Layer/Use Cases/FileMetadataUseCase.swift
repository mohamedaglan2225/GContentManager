//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//


import Foundation

public protocol FileMetadataUseCaseProtocol {
    func getFileItem(at path: String) -> FileItem?
    func getFileItems(in directoryPath: String) -> [FileItem]
    func getSize(of fileItem: FileItem) -> Int64
}

public final class FileMetadataUseCase: FileMetadataUseCaseProtocol {
    private let fileSystemRepository: FileSystemRepositoryProtocol

    public init(fileSystemRepository: FileSystemRepositoryProtocol) {
        self.fileSystemRepository = fileSystemRepository
    }

    public func getFileItem(at path: String) -> FileItem? {
        return fileSystemRepository.getFileItem(at: path)
    }

    public func getFileItems(in directoryPath: String) -> [FileItem] {
        return fileSystemRepository.getFileItems(in: directoryPath)
    }

    public func getSize(of fileItem: FileItem) -> Int64 {
        return fileSystemRepository.getSize(of: fileItem)
    }
}
