//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//

import Foundation

public protocol ICloudFileRepositoryProtocol {
    func fetchICloudFiles(completion: @escaping ([ICloudFileData]) -> Void)
    func startMonitoring()
    func stopMonitoring()
}

public final class ICloudFileRepository: ICloudFileRepositoryProtocol {
    private let iCloudFileService: ICloudFileServiceProtocol

    public init(iCloudFileService: ICloudFileServiceProtocol) {
        self.iCloudFileService = iCloudFileService
    }

    public func fetchICloudFiles(completion: @escaping ([ICloudFileData]) -> Void) {
        iCloudFileService.fetchICloudFiles(completion: completion)
    }

    public func startMonitoring() {
        iCloudFileService.startMonitoring()
    }

    public func stopMonitoring() {
        iCloudFileService.stopMonitoring()
    }
}
