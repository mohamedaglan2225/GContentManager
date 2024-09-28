//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//


import Foundation

public protocol ContentRepositoryProtocol {
    func move(content: Content, to newFolder: Content, completion: @escaping (Result<Void, Error>) -> Void)
    func delete(content: Content, toTrash: Bool, completion: @escaping (Result<Void, Error>) -> Void)
    func copy(content: Content, to newFolder: Content, completion: @escaping (Result<Void, Error>) -> Void)
    func rename(content: Content, to newName: String, completion: @escaping (Result<Void, Error>) -> Void)
}

public final class ContentRepository: ContentRepositoryProtocol {
    private let fileService: FileServiceProtocol

    public init(fileService: FileServiceProtocol) {
        self.fileService = fileService
    }

    public func move(content: Content, to newFolder: Content, completion: @escaping (Result<Void, Error>) -> Void) {
        fileService.moveItem(from: content.path, to: newFolder.path, completion: completion)
    }

    public func delete(content: Content, toTrash: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        fileService.deleteItem(at: content.path, toTrash: toTrash, completion: completion)
    }

    public func copy(content: Content, to newFolder: Content, completion: @escaping (Result<Void, Error>) -> Void) {
        fileService.copyItem(from: content.path, to: newFolder.path, completion: completion)
    }

    public func rename(content: Content, to newName: String, completion: @escaping (Result<Void, Error>) -> Void) {
        fileService.renameItem(at: content.path, to: newName, completion: completion)
    }
}
