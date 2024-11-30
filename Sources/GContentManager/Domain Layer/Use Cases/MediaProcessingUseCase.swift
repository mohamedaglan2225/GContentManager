//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation
import UIKit

public protocol MediaProcessingUseCaseProtocol {
    func generateThumbnail(for fileItem: FileItem, completion: @escaping (UIImage?) -> Void)
    func getMediaDuration(for fileItem: FileItem) -> Double
}

public final class MediaProcessingUseCase: MediaProcessingUseCaseProtocol {
    private let mediaFileRepository: MediaFileRepositoryProtocol

    public init(mediaFileRepository: MediaFileRepositoryProtocol) {
        self.mediaFileRepository = mediaFileRepository
    }

    public func generateThumbnail(for fileItem: FileItem, completion: @escaping (UIImage?) -> Void) {
        mediaFileRepository.generateThumbnail(for: fileItem, completion: completion)
    }

    public func getMediaDuration(for fileItem: FileItem) -> Double {
        return mediaFileRepository.getMediaDuration(for: fileItem)
    }
}

