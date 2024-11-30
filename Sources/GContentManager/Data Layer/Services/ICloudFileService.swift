//
//  File.swift
//  GContentManager
//
//  Created by Mohamed Aglan on 11/30/24.
//

import Foundation

public protocol ICloudFileServiceProtocol {
    func fetchICloudFiles(completion: @escaping ([ICloudFileData]) -> Void)
    func startMonitoring()
    func stopMonitoring()
}

public final class ICloudFileService: NSObject, ICloudFileServiceProtocol {
    private var metadataQuery: NSMetadataQuery?
    private var completionHandler: (([ICloudFileData]) -> Void)?

    public func fetchICloudFiles(completion: @escaping ([ICloudFileData]) -> Void) {
        self.completionHandler = completion

        metadataQuery = NSMetadataQuery()
        metadataQuery?.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]
        metadataQuery?.predicate = NSPredicate(format: "%K LIKE '*'", NSMetadataItemFSNameKey)

        NotificationCenter.default.addObserver(self, selector: #selector(queryDidUpdate(_:)), name: .NSMetadataQueryDidUpdate, object: metadataQuery)
        NotificationCenter.default.addObserver(self, selector: #selector(queryDidFinishGathering(_:)), name: .NSMetadataQueryDidFinishGathering, object: metadataQuery)

        metadataQuery?.start()
    }

    public func startMonitoring() {
        // Implement monitoring logic if needed
    }

    public func stopMonitoring() {
        metadataQuery?.stop()
        metadataQuery = nil
        NotificationCenter.default.removeObserver(self)
        completionHandler = nil
    }

    @objc private func queryDidUpdate(_ notification: Notification) {
        // Optionally handle updates here
    }

    @objc private func queryDidFinishGathering(_ notification: Notification) {
        guard let query = notification.object as? NSMetadataQuery else { return }
        var iCloudFileDataList: [ICloudFileData] = []

        for item in query.results {
            if let metadataItem = item as? NSMetadataItem,
               let url = metadataItem.value(forAttribute: NSMetadataItemURLKey) as? URL {

                // Use NSMetadataUbiquitousItemDownloadingStatusKey instead
                let downloadingStatus = metadataItem.value(forAttribute: NSMetadataUbiquitousItemDownloadingStatusKey) as? String

                // Possible values for downloadingStatus
                let NSMetadataUbiquitousItemDownloadingStatusCurrent = "current"
                let NSMetadataUbiquitousItemDownloadingStatusDownloaded = "downloaded"
                let NSMetadataUbiquitousItemDownloadingStatusNotDownloaded = "not downloaded"

                let isDownloaded = downloadingStatus == NSMetadataUbiquitousItemDownloadingStatusCurrent
                let isNotDownloaded = downloadingStatus == NSMetadataUbiquitousItemDownloadingStatusNotDownloaded
                let isDownloading = downloadingStatus == NSMetadataUbiquitousItemDownloadingStatusDownloaded

                let isUploaded = metadataItem.value(forAttribute: NSMetadataUbiquitousItemIsUploadedKey) as? Bool ?? false
                let isUploading = metadataItem.value(forAttribute: NSMetadataUbiquitousItemIsUploadingKey) as? Bool ?? false

                let percentDownloaded = metadataItem.value(forAttribute: NSMetadataUbiquitousItemPercentDownloadedKey) as? Double ?? 0
                let percentUploaded = metadataItem.value(forAttribute: NSMetadataUbiquitousItemPercentUploadedKey) as? Double ?? 0

                let percentage = isDownloading ? percentDownloaded : (isUploading ? percentUploaded : 0)

                let iCloudFileData = ICloudFileData(
                    id: url.hashValue,
                    name: url.lastPathComponent,
                    percentage: percentage,
                    isUploaded: isUploaded,
                    isUploading: isUploading,
                    isDownloading: isDownloading,
                    isNotDownloaded: isNotDownloaded,
                    isDownloaded: isDownloaded
                )
                iCloudFileDataList.append(iCloudFileData)
            }
        }

        // Call the completion handler with the updated iCloudFileDataList
        completionHandler?(iCloudFileDataList)
    }
}

