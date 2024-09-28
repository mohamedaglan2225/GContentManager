//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//


import UIKit

public protocol ImageServiceProtocol {
    func loadImage(for content: Content, completion: @escaping (UIImage?) -> Void)
}

public final class ImageService: ImageServiceProtocol {
    public init() {}

    public func loadImage(for content: Content, completion: @escaping (UIImage?) -> Void) {
        guard let image = UIImage(contentsOfFile: content.path) else {
            completion(nil)
            return
        }
        completion(image)
    }
}
