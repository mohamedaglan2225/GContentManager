# GContentManager -

**GContentManager** This Swift package provides an efficient and modular solution for managing file and folder operations, including moving, deleting, copying, and renaming files. It also integrates with iCloud, allowing seamless file synchronization and management across cloud storage. The package follows clean architecture principles to ensure a scalable, maintainable, and testable structure, making it suitable for both small-scale and enterprise-level applications. It supports various file types and offers functionality for handling multimedia content and cloud-based files.

## Features


- File and Folder Management (move, delete, copy, and rename files)
- iCloud Integration
- Supports Clean Architecture and Clean Code principles
- Extendable and modular design
- Support for multimedia file types and iCloud folders

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Basic Setup](#basic-setup)
  - [Adding Custom Colors](#adding-custom-colors)
  - [Setting Colors to UI Components](#setting-colors-to-ui-components)
- [Example](#example)
- [Contributing](#contributing)
- [License](#license)

## Installation

### Requirements

- iOS 12.0+
- Swift 5.0+
- Xcode 12.0+
- UIKit

### Swift Package Manager

You can add the package to your Swift project using Swift Package Manager (SPM):

1. In Xcode, go to **File > Swift Packages > Add Package Dependency**.
2. Enter the following URL:
```  "https://github.com/mohamedaglan2225/GContentManager.git"  ```
4. Choose the latest version and finish the installation.
Alternatively, add the following line to your `Package.swift` file:

```swift
dependencies: [
 .package(url: "https://github.com/mohamedaglan2225/GContentManager.git", from: "1.0.0")
]

```

### Usage

```
1. Content Management
To create and manage content (folders and files), you can use the Content class. Example usage:

```

1. import YourPackage

```
let mainFolder = Content(id: 1, name: "Main Folder", type: .folder, path: "/Documents")
let subFolder = Content(id: 2, name: "Sub Folder", type: .folder, path: "/Documents/Sub Folder", superFolder: mainFolder)

mainFolder.add(subFolder)
```

2. File Operations

```
Use the FileService to perform operations such as moving, copying, or deleting files:

import GContentManager

let fileService = FileService()

fileService.moveItem(from: "/path/to/file", to: "/new/path/to/file") { result in
    switch result {
    case .success:
        print("File moved successfully")
    case .failure(let error):
        print("Error moving file: \(error)")
    }
}

```


3. iCloud Integration

```
You can use the ICloudRepository to interact with iCloud, fetch iCloud data, and monitor file changes:

import GContentManager

let iCloudRepo = ICloudRepository(iCloudService: ICloudService())

iCloudRepo.fetchICloudData { iCloudData in
    print("Fetched iCloud Data: \(iCloudData)")
}

iCloudRepo.startMonitoring()


```






