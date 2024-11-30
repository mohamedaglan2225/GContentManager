//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//

import Foundation

public class FileUtilities {
    public static func trashDirectoryPath() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let trashPath = (documentsPath as NSString).appendingPathComponent(".Trash")
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: trashPath) {
            try? fileManager.createDirectory(atPath: trashPath, withIntermediateDirectories: true, attributes: nil)
        }
        return trashPath
    }
}
