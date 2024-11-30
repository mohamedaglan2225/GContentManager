//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation

public protocol ICloudSyncUseCaseProtocol {
    func fetchICloudFiles(completion: @escaping ([ICloudFileData]) -> Void)
    func startICloudMonitoring()
    func stopICloudMonitoring()
}

public final class ICloudSyncUseCase: ICloudSyncUseCaseProtocol {
    private let iCloudFileRepository: ICloudFileRepositoryProtocol

    public init(iCloudFileRepository: ICloudFileRepositoryProtocol) {
        self.iCloudFileRepository = iCloudFileRepository
    }

    public func fetchICloudFiles(completion: @escaping ([ICloudFileData]) -> Void) {
        iCloudFileRepository.fetchICloudFiles(completion: completion)
    }

    public func startICloudMonitoring() {
        iCloudFileRepository.startMonitoring()
    }

    public func stopICloudMonitoring() {
        iCloudFileRepository.stopMonitoring()
    }
}

