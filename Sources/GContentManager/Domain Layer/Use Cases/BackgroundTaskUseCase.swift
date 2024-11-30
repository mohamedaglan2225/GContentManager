//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation

public protocol BackgroundTaskUseCaseProtocol {
    func performBackgroundTask(_ task: @escaping () -> Void)
}

public final class BackgroundTaskUseCase: BackgroundTaskUseCaseProtocol {
    
    public init() {
       
    }
    
    public func performBackgroundTask(_ task: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            task()
        }
    }
}
