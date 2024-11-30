//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//

import UIKit

public enum FileType: Int, Codable {
    case folder
    case video
    case audio
    case image
    case pdf
    case presentation
    case document
    case archive
    case playlist
    case other
    case subtitle
    case iCloudDownload
    case stickers
    case spreadsheet

    public var description: String {
        switch self {
        case .folder:
            return NSLocalizedString("Folder", comment: "")
        case .video:
            return NSLocalizedString("Video", comment: "")
        case .audio:
            return NSLocalizedString("Audio", comment: "")
        case .image:
            return NSLocalizedString("Image", comment: "")
        case .pdf:
            return NSLocalizedString("PDF Document", comment: "")
        case .presentation:
            return NSLocalizedString("Presentation", comment: "")
        case .document:
            return NSLocalizedString("Text Document", comment: "")
        case .archive:
            return NSLocalizedString("Archive", comment: "")
        case .playlist:
            return NSLocalizedString("Playlist", comment: "")
        case .other:
            return NSLocalizedString("Unknown", comment: "")
        case .subtitle:
            return NSLocalizedString("Subtitle", comment: "")
        case .iCloudDownload:
            return NSLocalizedString("iCloud Download", comment: "")
        case .stickers:
            return NSLocalizedString("Stickers", comment: "")
        case .spreadsheet:
            return NSLocalizedString("Spreadsheet", comment: "")
        }
    }

    public var icon: UIImage? {
        switch self {
        case .folder:
            return UIImage(named: "Folder")
        case .video:
            return UIImage(named: "Video")
        case .audio:
            return UIImage(named: "Audio")
        case .image:
            return UIImage(named: "Image")
        case .pdf:
            return UIImage(named: "PDF")
        case .presentation:
            return UIImage(named: "Presentation")
        case .document:
            return UIImage(named: "Document")
        case .archive:
            return UIImage(named: "Archive")
        case .playlist:
            return UIImage(named: "Playlist")
        case .subtitle:
            return UIImage(named: "Subtitle")
        case .iCloudDownload:
            return UIImage(named: "iCloud")
        case .stickers:
            return UIImage(named: "Stickers")
        case .spreadsheet:
            return UIImage(named: "Spreadsheet")
        case .other:
            return UIImage(named: "Unknown")
        }
    }

    public static func type(for fileExtension: String) -> FileType {
        switch fileExtension.lowercased() {
        case "mp4", "m4v", "mov":
            return .video
        case "mp3", "wav", "aac", "wma", "m4a", "m4r", "aiff", "caf":
            return .audio
        case "png", "jpg", "jpeg", "bmp", "tiff", "gif", "heic":
            return .image
        case "pdf":
            return .pdf
        case "ppt", "pptx":
            return .presentation
        case "txt", "doc", "docx":
            return .document
        case "zip", "rar", "7z":
            return .archive
        case "playlist":
            return .playlist
        case "srt":
            return .subtitle
        case "icloud":
            return .iCloudDownload
        case "stickers":
            return .stickers
        case "xls", "xlsx":
            return .spreadsheet
        default:
            return .other
        }
    }
}
