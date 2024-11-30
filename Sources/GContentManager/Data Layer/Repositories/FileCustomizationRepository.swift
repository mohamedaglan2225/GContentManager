//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation
import UIKit

public protocol FileCustomizationRepositoryProtocol {
    func setColor(for fileItem: FileItem, color: UIColor)
    func pinFileItem(_ fileItem: FileItem)
    func unpinFileItem(_ fileItem: FileItem)
    func getColor(for fileItem: FileItem) -> UIColor?
    func isPinned(_ fileItem: FileItem) -> Bool
}

public final class FileCustomizationRepository: FileCustomizationRepositoryProtocol {
    
    public init() {
       
    }
    
    private var fileItemColors: [Int: UIColor] = [:]
    private var pinnedFileItems: Set<Int> = []

    public func setColor(for fileItem: FileItem, color: UIColor) {
        fileItemColors[fileItem.id] = color
    }

    public func pinFileItem(_ fileItem: FileItem) {
        pinnedFileItems.insert(fileItem.id)
    }

    public func unpinFileItem(_ fileItem: FileItem) {
        pinnedFileItems.remove(fileItem.id)
    }

    public func getColor(for fileItem: FileItem) -> UIColor? {
        return fileItemColors[fileItem.id]
    }

    public func isPinned(_ fileItem: FileItem) -> Bool {
        return pinnedFileItems.contains(fileItem.id)
    }
}

