//
//  ImageLoader.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 28/10/2022.
//

import UIKit

enum ImageLoaderError: Error {
    case DownloadFailed
    case CouldNotCreateURL
}

actor ImageLoader: ObservableObject {
    enum DownloadState {
        case inProgress(Task<UIImage, Error>)
        case completed(UIImage)
        case failed
    }

    private(set) var cache: [String: DownloadState] = [:]

    @MainActor private(set) var inMemoryAccess: AsyncStream<Int>?
    private var inMemoryAccessContinuation: AsyncStream<Int>.Continuation?
    private var inMemoryAccessCounter = 0 {
        didSet { inMemoryAccessContinuation?.yield(inMemoryAccessCounter) }
    }

    deinit {
        inMemoryAccessContinuation?.finish()
    }

    func setUp() async {
        let accessStream = AsyncStream<Int> { continuation in
            inMemoryAccessContinuation = continuation
        }
        await MainActor.run { inMemoryAccess = accessStream }
    }

    func add(_ image: UIImage, forKey key: String) {
        cache[key] = .completed(image)
    }

    func image(_ serverPath: String) async throws -> UIImage {
        if let cached = cache[serverPath] {
            switch cached {
            case .completed(let image):
                inMemoryAccessCounter += 1
                return image
            case .inProgress(let task):
                return try await task.value
            case .failed: throw ImageLoaderError.DownloadFailed
            }
        }

        let download: Task<UIImage, Error> = Task.detached {
            guard let url = URL(string: "".appending(serverPath))
            else {
                throw ImageLoaderError.CouldNotCreateURL
            }
            print("Download: \(url.absoluteString)")
            let data = try await URLSession.shared.data(from: url).0
            return try resize(data, to: CGSize(width: 200, height: 200))
        }

        cache[serverPath] = .inProgress(download)

        do {
            let result = try await download.value
            add(result, forKey: serverPath)
            return result
        } catch {
            cache[serverPath] = .failed
            throw error
        }
    }

    func clear() {
        cache.removeAll()
    }
}

