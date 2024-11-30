//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation

public struct ICloudFileData: Equatable, Hashable {
    public var id: Int
    public var name: String
    public var percentage: Double
    public var isUploaded: Bool
    public var isUploading: Bool
    public var isDownloading: Bool
    public var isNotDownloaded: Bool
    public var isDownloaded: Bool
    public var parentFolderDepth: Int

    public init(
        id: Int,
        name: String,
        percentage: Double = 0,
        isUploaded: Bool = false,
        isUploading: Bool = false,
        isDownloading: Bool = false,
        isNotDownloaded: Bool = false,
        isDownloaded: Bool = false,
        parentFolderDepth: Int = 0
    ) {
        self.id = id
        self.name = name
        self.percentage = percentage
        self.isUploaded = isUploaded
        self.isUploading = isUploading
        self.isDownloading = isDownloading
        self.isNotDownloaded = isNotDownloaded
        self.isDownloaded = isDownloaded
        self.parentFolderDepth = parentFolderDepth
    }
}

