//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//


import Foundation

public protocol ICloudUseCaseProtocol {
    func fetchICloudData(completion: @escaping ([ICloudData]) -> Void)
    func startMonitoringICloud()
    func stopMonitoringICloud()
}

public final class ICloudUseCase: ICloudUseCaseProtocol {
    private let repository: ICloudRepositoryProtocol

    public init(repository: ICloudRepositoryProtocol) {
        self.repository = repository
    }

    public func fetchICloudData(completion: @escaping ([ICloudData]) -> Void) {
        repository.fetchICloudData(completion: completion)
    }

    public func startMonitoringICloud() {
        repository.startMonitoring()
    }

    public func stopMonitoringICloud() {
        repository.stopMonitoring()
    }
}
