//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//


import UIKit

public protocol ContentUseCaseProtocol {
    func moveContent(_ content: Content, to newFolder: Content, completion: @escaping (Result<Void, Error>) -> Void)
    func deleteContent(_ content: Content, toTrash: Bool, completion: @escaping (Result<Void, Error>) -> Void)
    func copyContent(_ content: Content, to newFolder: Content, completion: @escaping (Result<Void, Error>) -> Void)
    func renameContent(_ content: Content, to newName: String, completion: @escaping (Result<Void, Error>) -> Void)
    func loadImage(for content: Content, completion: @escaping (UIImage?) -> Void)
}

public final class ContentUseCase: ContentUseCaseProtocol {
    private let repository: ContentRepositoryProtocol
    private let imageService: ImageServiceProtocol

    public init(repository: ContentRepositoryProtocol, imageService: ImageServiceProtocol) {
        self.repository = repository
        self.imageService = imageService
    }

    public func moveContent(_ content: Content, to newFolder: Content, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.move(content: content, to: newFolder, completion: completion)
    }

    public func deleteContent(_ content: Content, toTrash: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.delete(content: content, toTrash: toTrash, completion: completion)
    }

    public func copyContent(_ content: Content, to newFolder: Content, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.copy(content: content, to: newFolder, completion: completion)
    }

    public func renameContent(_ content: Content, to newName: String, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.rename(content: content, to: newName, completion: completion)
    }

    public func loadImage(for content: Content, completion: @escaping (UIImage?) -> Void) {
        imageService.loadImage(for: content, completion: completion)
    }
}
