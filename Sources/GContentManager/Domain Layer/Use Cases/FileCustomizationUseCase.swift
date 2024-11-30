//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation
import UIKit

public protocol FileCustomizationUseCaseProtocol {
    func setColor(for fileItem: FileItem, color: UIColor)
    func pinFileItem(_ fileItem: FileItem)
    func unpinFileItem(_ fileItem: FileItem)
    func getColor(for fileItem: FileItem) -> UIColor?
    func isPinned(_ fileItem: FileItem) -> Bool
}

public final class FileCustomizationUseCase: FileCustomizationUseCaseProtocol {
    
    private let fileCustomizationRepository: FileCustomizationRepositoryProtocol
    
    public init(fileCustomizationRepository: FileCustomizationRepositoryProtocol) {
        self.fileCustomizationRepository = fileCustomizationRepository
    }
    
    public func setColor(for fileItem: FileItem, color: UIColor) {
        fileCustomizationRepository.setColor(for: fileItem, color: color)
    }
    
    public func pinFileItem(_ fileItem: FileItem) {
        fileCustomizationRepository.pinFileItem(fileItem)
    }
    
    public func unpinFileItem(_ fileItem: FileItem) {
        fileCustomizationRepository.unpinFileItem(fileItem)
    }
    
    public func getColor(for fileItem: FileItem) -> UIColor? {
        return fileCustomizationRepository.getColor(for: fileItem)
    }
    
    public func isPinned(_ fileItem: FileItem) -> Bool {
        return fileCustomizationRepository.isPinned(fileItem)
    }
}

