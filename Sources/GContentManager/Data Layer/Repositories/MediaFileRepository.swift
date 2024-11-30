//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation
import UIKit
import AVFoundation

public protocol MediaFileRepositoryProtocol {
    func generateThumbnail(for fileItem: FileItem, completion: @escaping (UIImage?) -> Void)
    func getMediaDuration(for fileItem: FileItem) -> Double
}

public final class MediaFileRepository: MediaFileRepositoryProtocol {
    
    public init() {
        
    }
    
    public func generateThumbnail(for fileItem: FileItem, completion: @escaping (UIImage?) -> Void) {
        let asset = AVAsset(url: URL(fileURLWithPath: fileItem.path))
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        let time = CMTime(seconds: 1, preferredTimescale: 600)
        DispatchQueue.global().async {
            do {
                let imageRef = try imageGenerator.copyCGImage(at: time, actualTime: nil)
                let thumbnail = UIImage(cgImage: imageRef)
                DispatchQueue.main.async {
                    completion(thumbnail)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

    public func getMediaDuration(for fileItem: FileItem) -> Double {
        let asset = AVAsset(url: URL(fileURLWithPath: fileItem.path))
        return CMTimeGetSeconds(asset.duration)
    }
}

