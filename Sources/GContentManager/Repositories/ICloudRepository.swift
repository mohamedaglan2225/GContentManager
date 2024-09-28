//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//

import Foundation

public protocol ICloudServiceProtocol {
    func fetchICloudData(completion: @escaping ([ICloudData]) -> Void)
    func startMonitoring()
    func stopMonitoring()
}

public protocol ICloudRepositoryProtocol {
    func fetchICloudData(completion: @escaping ([ICloudData]) -> Void)
    func startMonitoring()
    func stopMonitoring()
}

public final class ICloudRepository: ICloudRepositoryProtocol {
    private let iCloudService: ICloudServiceProtocol

    public init(iCloudService: ICloudServiceProtocol) {
        self.iCloudService = iCloudService
    }

    public func fetchICloudData(completion: @escaping ([ICloudData]) -> Void) {
        iCloudService.fetchICloudData(completion: completion)
    }

    public func startMonitoring() {
        iCloudService.startMonitoring()
    }

    public func stopMonitoring() {
        iCloudService.stopMonitoring()
    }
}
