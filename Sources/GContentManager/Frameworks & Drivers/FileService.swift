//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//


import Foundation

public protocol FileServiceProtocol {
    func moveItem(from: String, to: String, completion: @escaping (Result<Void, Error>) -> Void)
    func deleteItem(at: String, toTrash: Bool, completion: @escaping (Result<Void, Error>) -> Void)
    func copyItem(from: String, to: String, completion: @escaping (Result<Void, Error>) -> Void)
    func renameItem(at: String, to: String, completion: @escaping (Result<Void, Error>) -> Void)
}

public final class FileService: FileServiceProtocol {
    private let fileManager: FileManager

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    public func moveItem(from: String, to: String, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try fileManager.moveItem(atPath: from, toPath: to)
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }

    public func deleteItem(at: String, toTrash: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try fileManager.removeItem(atPath: at)
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }

    public func copyItem(from: String, to: String, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try fileManager.copyItem(atPath: from, toPath: to)
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }

    public func renameItem(at: String, to: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let newPath = (at as NSString).deletingLastPathComponent.appendingPathComponent(to)
        moveItem(from: at, to: newPath, completion: completion)
    }
}
