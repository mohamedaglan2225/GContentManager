//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation

public protocol SortingAndSearchingUseCaseProtocol {
    func sort(fileItems: [FileItem], by criterion: SortCriterion, ascending: Bool) -> [FileItem]
    func search(fileItems: [FileItem], for query: String) -> [FileItem]
}

public enum SortCriterion {
    case name
    case size
    case creationDate
    case modificationDate
    case type
    case custom
}

public final class SortingAndSearchingUseCase: SortingAndSearchingUseCaseProtocol {
    
    public init() {
       
    }
    
    public func sort(fileItems: [FileItem], by criterion: SortCriterion, ascending: Bool) -> [FileItem] {
        let sortedFileItems: [FileItem]
        switch criterion {
        case .name:
            sortedFileItems = fileItems.sorted { ascending ? $0.name.lowercased() < $1.name.lowercased() : $0.name.lowercased() > $1.name.lowercased() }
        case .size:
            sortedFileItems = fileItems.sorted { ascending ? $0.size < $1.size : $0.size > $1.size }
        case .creationDate:
            sortedFileItems = fileItems.sorted { ascending ? $0.creationDate < $1.creationDate : $0.creationDate > $1.creationDate }
        case .modificationDate:
            sortedFileItems = fileItems.sorted { ascending ? $0.modificationDate < $1.modificationDate : $0.modificationDate > $1.modificationDate }
        case .type:
            sortedFileItems = fileItems.sorted { ascending ? $0.type.rawValue < $1.type.rawValue : $0.type.rawValue > $1.type.rawValue }
        case .custom:
            sortedFileItems = fileItems.sorted { ascending ? $0.customSortID < $1.customSortID : $0.customSortID > $1.customSortID }
        }
        return sortedFileItems
    }

    public func search(fileItems: [FileItem], for query: String) -> [FileItem] {
        return fileItems.filter { $0.name.lowercased().contains(query.lowercased()) }
    }
}

