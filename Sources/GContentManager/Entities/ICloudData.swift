//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//

public struct ICloudData: Equatable, Hashable {
    public var id: Int
    public var name: String
    public var percentage: Double
    public var isUploaded: Bool
    public var isUploading: Bool
    public var isDownloading: Bool
    public var isNotDownloaded: Bool
    public var isDownloaded: Bool
}
