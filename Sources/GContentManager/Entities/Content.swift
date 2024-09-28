//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/28/24.
//

// Content.swift

public class Content: Equatable, Hashable {
    public let id: Int
    public let name: String
    public var type: ContentType
    public var path: String
    public var isSelected: Bool = false
    public var isPinned: Bool = false
    public weak var superFolder: Content?

    public init(id: Int, name: String, type: ContentType, path: String, superFolder: Content? = nil) {
        self.id = id
        self.name = name
        self.type = type
        self.path = path
        self.superFolder = superFolder
    }

    public static func == (lhs: Content, rhs: Content) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
