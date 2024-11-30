# GContentManager

**GContentManager** is a comprehensive Swift package designed to simplify file management tasks in your iOS applications. It provides a clean and modular architecture for performing various file operations, retrieving file metadata, integrating with iCloud, handling trash management, securing files, processing media, customizing files, sorting and searching, and performing background tasks.

## Table of Contents

- Features
- Requirements
- Installation
- Swift Package Manager
- Getting Started
- Initialization
- Usage
- File Operations
- Create Folder
- Rename Item
- Move Item
- Copy Item
- Delete Item
- File Metadata Retrieval
- Get File Item
- Get File Items in Directory
- iCloud Integration
- Fetch iCloud Files
- Start/Stop iCloud Monitoring
- Trash Management
- Empty Trash
- Restore Item from Trash
- File Locking and Security
- Lock File Item
- Unlock File Item
- Check if File Item is Locked
- Media Processing
- Generate Thumbnail
- Get Media Duration
- File Customization
- Set Color for File Item
- Pin/Unpin File Item
- Check if File Item is Pinned
- Sorting and Searching
- Sort File Items
- Search File Items
- Background Tasks
- Perform Background Task
- Example
- License


## Features

. File Operations: Create, rename, move, copy, and delete files and folders.
. File Metadata Retrieval: Access file metadata such as name, size, type, and dates.
. iCloud Integration: Fetch and monitor iCloud files.
. Trash Management: Empty trash and restore items from trash.
. File Locking and Security: Lock and unlock files with password protection.
. Media Processing: Generate thumbnails and retrieve media duration.
. File Customization: Set custom colors and pin/unpin files.
. Sorting and Searching: Sort files based on various criteria and search files.
. Background Tasks: Perform operations in the background.


## Requirements

. iOS 13.0 or later
. Swift 5.3 or later


## Installation

Swift Package Manager
To integrate GContentManager into your Xcode project using Swift Package Manager, follow these steps:

File > Swift Packages > Add Package Dependency...
Enter the repository URL:
https://github.com/mohamedaglan2225/GContentManager.git
Select the latest version and proceed with the installation.


## Getting Started

Initialization
Before using GContentManager, you need to initialize the necessary services, repositories, and use cases. It's recommended to use a dependency manager or a singleton to manage these dependencies.

Example: DependencyManager.swift

import GContentManager

```
class DependencyManager {
    static let shared = DependencyManager()

    // Services
    private let fileSystemService = FileSystemService()
    private let fileMetadataService = FileMetadataService()
    private let iCloudFileService = ICloudFileService()

    // Repositories
    private lazy var fileSystemRepository = FileSystemRepository(
        fileSystemService: fileSystemService,
        fileMetadataService: fileMetadataService
    )
    private lazy var iCloudFileRepository = ICloudFileRepository(iCloudFileService: iCloudFileService)
    private lazy var mediaFileRepository = MediaFileRepository()
    private lazy var fileCustomizationRepository = FileCustomizationRepository()
    private lazy var fileSecurityRepository = FileSecurityRepository()

    // Use Cases
    lazy var fileOperationsUseCase = FileOperationsUseCase(fileSystemRepository: fileSystemRepository)
    lazy var fileMetadataUseCase = FileMetadataUseCase(fileSystemRepository: fileSystemRepository)
    lazy var iCloudSyncUseCase = ICloudSyncUseCase(iCloudFileRepository: iCloudFileRepository)
    lazy var trashManagementUseCase = TrashManagementUseCase(fileSystemRepository: fileSystemRepository)
    lazy var fileLockingUseCase = FileLockingUseCase(fileSecurityRepository: fileSecurityRepository)
    lazy var mediaProcessingUseCase = MediaProcessingUseCase(mediaFileRepository: mediaFileRepository)
    lazy var fileCustomizationUseCase = FileCustomizationUseCase(fileCustomizationRepository: fileCustomizationRepository)
    lazy var sortingAndSearchingUseCase = SortingAndSearchingUseCase()
    lazy var backgroundTaskUseCase = BackgroundTaskUseCase()
}
```

##Usage

File Operations: 

1- Create Folder

Create a new folder at a specified path.

```
do {
    let newFolder = try fileOperationsUseCase.createFolder(at: "/path/to/directory", named: "NewFolder")
    print("Folder created: \(newFolder.name)")
} catch {
    print("Error creating folder: \(error)")
}
```

2- Rename Item

Rename a file or folder at a specified path.

```
do {
    try fileOperationsUseCase.renameItem(at: "/path/to/item", to: "NewName")
    print("Item renamed successfully.")
} catch {
    print("Error renaming item: \(error)")
}
```

3- Move Item

Move a file or folder to a new location.

```
do {
    try fileOperationsUseCase.moveItem(at: "/path/to/sourceItem", to: "/path/to/destination")
    print("Item moved successfully.")
} catch {
    print("Error moving item: \(error)")
}

```

4- Copy Item

Copy a file or folder to a new location.

```
do {
    try fileOperationsUseCase.copyItem(at: "/path/to/sourceItem", to: "/path/to/destination")
    print("Item copied successfully.")
} catch {
    print("Error copying item: \(error)")
}

```

5- Delete Item

Delete a file or folder, optionally moving it to trash.

```
do {
    try fileOperationsUseCase.deleteItem(at: "/path/to/item", moveToTrash: true)
    print("Item deleted (moved to trash).")
} catch {
    print("Error deleting item: \(error)")
}

```

## File Metadata Retrieval

1- Get File Item

Retrieve metadata for a single file or folder.

```
if let fileItem = fileMetadataUseCase.getFileItem(at: "/path/to/item") {
    print("File Name: \(fileItem.name)")
    print("File Size: \(fileItem.size)")
    print("File Type: \(fileItem.type.description)")
}

```


2- Get File Items in Directory

Retrieve metadata for all files and folders in a directory.

```
let fileItems = fileMetadataUseCase.getFileItems(in: "/path/to/directory")
for item in fileItems {
    print("Item Name: \(item.name), Type: \(item.type.description)")
}

```



## iCloud Integration

1- Fetch iCloud Files

Fetch a list of files stored in iCloud.

```
iCloudSyncUseCase.fetchICloudFiles { iCloudFiles in
    for file in iCloudFiles {
        print("iCloud File: \(file.name), Downloaded: \(file.isDownloaded)")
    }
}

```

2- Start/Stop iCloud Monitoring

Monitor changes in iCloud files.

```
// Start monitoring
iCloudSyncUseCase.startICloudMonitoring()

// Stop monitoring
iCloudSyncUseCase.stopICloudMonitoring()

```


## Trash Management

1- Empty Trash

Permanently delete all items in the trash.

```
do {
    try trashManagementUseCase.emptyTrash()
    print("Trash emptied successfully.")
} catch {
    print("Error emptying trash: \(error)")
}

```

2- Restore Item from Trash

Restore an item from the trash to a specified location.

```
do {
    try trashManagementUseCase.restoreItem(fromTrash: "/path/to/trash/item", to: "/path/to/restore/location")
    print("Item restored from trash.")
} catch {
    print("Error restoring item: \(error)")
}

```


## File Locking and Security

1- Lock File Item

Lock a file with password protection.

```
do {
    if let fileItem = fileMetadataUseCase.getFileItem(at: "/path/to/file") {
        try fileLockingUseCase.lockFileItem(fileItem)
        print("File locked.")
    }
} catch {
    print("Error locking file: \(error)")
}

```


2- Unlock File Item

Unlock a password-protected file.

```
do {
    if let fileItem = fileMetadataUseCase.getFileItem(at: "/path/to/file") {
        try fileLockingUseCase.unlockFileItem(fileItem, withPassword: "password")
        print("File unlocked.")
    }
} catch {
    print("Error unlocking file: \(error)")
}

```



3- Check if File Item is Locked

Check if a file is locked.

```
if let fileItem = fileMetadataUseCase.getFileItem(at: "/path/to/file") {
    let isLocked = fileLockingUseCase.isFileItemLocked(fileItem)
    print("Is file locked? \(isLocked)")
}

```



## Media Processing

1- Generate Thumbnail

Generate a thumbnail image for a media file.

```
if let fileItem = fileMetadataUseCase.getFileItem(at: "/path/to/video.mp4") {
    mediaProcessingUseCase.generateThumbnail(for: fileItem) { thumbnail in
        if let image = thumbnail {
            // Display the image in your UI
            print("Thumbnail generated.")
        } else {
            print("Failed to generate thumbnail.")
        }
    }
}

```

2- Get Media Duration

Retrieve the duration of a media file.

```
if let fileItem = fileMetadataUseCase.getFileItem(at: "/path/to/audio.mp3") {
    let duration = mediaProcessingUseCase.getMediaDuration(for: fileItem)
    print("Media Duration: \(duration) seconds")
}

```


## File Customization

1- Set Color for File Item

Set a custom color for a file or folder.

```
if let fileItem = fileMetadataUseCase.getFileItem(at: "/path/to/item") {
    fileCustomizationUseCase.setColor(for: fileItem, color: UIColor.red)
    print("Color set for item.")
}

```


2- Pin/Unpin File Item

Pin or unpin a file or folder.

```
if let fileItem = fileMetadataUseCase.getFileItem(at: "/path/to/item") {
    // Pin the item
    fileCustomizationUseCase.pinFileItem(fileItem)
    print("Item pinned.")

    // Unpin the item
    fileCustomizationUseCase.unpinFileItem(fileItem)
    print("Item unpinned.")
}

```


3- Check if File Item is Pinned

Check if a file or folder is pinned.

```
if let fileItem = fileMetadataUseCase.getFileItem(at: "/path/to/item") {
    let isPinned = fileCustomizationUseCase.isPinned(fileItem)
    print("Is item pinned? \(isPinned)")
}

```


## Sorting and Searching

1- Sort File Items

Sort a list of file items based on a criterion.

```

let fileItems = fileMetadataUseCase.getFileItems(in: "/path/to/directory")
let sortedItems = sortingAndSearchingUseCase.sort(fileItems: fileItems, by: .name, ascending: true)
for item in sortedItems {
    print("Sorted Item: \(item.name)")
}

```


2- Search File Items

Search for files matching a query.


```

let fileItems = fileMetadataUseCase.getFileItems(in: "/path/to/directory")
let searchResults = sortingAndSearchingUseCase.search(fileItems: fileItems, for: "searchQuery")
for item in searchResults {
    print("Found Item: \(item.name)")
}

```


## Background Tasks

1- Perform Background Task

Execute a long-running task in the background.

```
backgroundTaskUseCase.performBackgroundTask {
    // Perform long-running task
    print("Background task started.")
    // ...
    print("Background task completed.")
}

```


### Example

Here's a complete example demonstrating how to integrate GContentManager into your ViewController:

```
import UIKit
import GContentManager

class ViewController: UIViewController {

    // Use Cases
    let fileOperationsUseCase = DependencyManager.shared.fileOperationsUseCase
    let fileMetadataUseCase = DependencyManager.shared.fileMetadataUseCase
    let fileLockingUseCase = DependencyManager.shared.fileLockingUseCase
    let mediaProcessingUseCase = DependencyManager.shared.mediaProcessingUseCase
    let fileCustomizationUseCase = DependencyManager.shared.fileCustomizationUseCase
    let sortingAndSearchingUseCase = DependencyManager.shared.sortingAndSearchingUseCase
    let backgroundTaskUseCase = DependencyManager.shared.backgroundTaskUseCase
    let trashManagementUseCase = DependencyManager.shared.trashManagementUseCase

    override func viewDidLoad() {
        super.viewDidLoad()
        // Example usage
        createFolderExample()
    }

    func createFolderExample() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do {
            let newFolder = try fileOperationsUseCase.createFolder(at: documentsPath, named: "NewFolder")
            print("Folder created: \(newFolder.name)")
        } catch {
            print("Error creating folder: \(error)")
        }
    }
}

```


