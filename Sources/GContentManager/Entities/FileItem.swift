//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//

import Foundation
import UIKit

public struct FileItem: Equatable, Hashable {
    public let id: Int
    public let name: String
    public let path: String
    public let type: FileType
    public var size: Int64
    public var lockStatus: LockStatus
    public var creationDate: Date
    public var modificationDate: Date
    public var color: UIColor?
    public var isPinned: Bool
    public var isSelected: Bool
    public var isLocked: Bool
    public var customSortID: Int

    // Additional metadata for iCloud integration
    public var iCloudData: ICloudFileData?

    public init(
        id: Int,
        name: String,
        path: String,
        type: FileType,
        size: Int64,
        lockStatus: LockStatus = .noLock,
        creationDate: Date,
        modificationDate: Date,
        color: UIColor? = nil,
        isPinned: Bool = false,
        isSelected: Bool = false,
        isLocked: Bool = false,
        customSortID: Int = 0,
        iCloudData: ICloudFileData? = nil
    ) {
        self.id = id
        self.name = name
        self.path = path
        self.type = type
        self.size = size
        self.lockStatus = lockStatus
        self.creationDate = creationDate
        self.modificationDate = modificationDate
        self.color = color
        self.isPinned = isPinned
        self.isSelected = isSelected
        self.isLocked = isLocked
        self.customSortID = customSortID
        self.iCloudData = iCloudData
    }
}
