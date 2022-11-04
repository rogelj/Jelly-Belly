//
//  DishImageModel.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 28/10/2022.
//

import UIKit

@globalActor actor ImageDatabase {
    static let shared = ImageDatabase()
    let imageLoader = ImageLoader()
    private var storage: DiskStorage!
    private var storedImagesIndex = Set<String>()

    func setUp() async throws {
        storage = await DiskStorage()
        for fileURL in try await storage.persistedFiles() {
            storedImagesIndex.insert(fileURL.lastPathComponent)
        }
    }

    func store(image: UIImage, forKey key: String) async throws {
        guard let data = image.pngData() else {
            throw "Could not save image \(key)"
        }
        let fileName = DiskStorage.fileName(for: key)
        try await storage.write(data, name: fileName)
        storedImagesIndex.insert(fileName)
    }

    func image(_ key: String) async throws -> UIImage {
        let keys = await imageLoader.cache.keys
        if keys.contains(key) {
            print("In memory cache.")
            return try await imageLoader.image(key)
        }
        do {
            let fileName = DiskStorage.fileName(for: key)
            if !storedImagesIndex.contains(fileName) {
                throw "Image not persisted."
            }
            let data = try await storage.read(name: fileName)
            guard let image = UIImage(data: data) else {
                throw "Invalid image data."
            }
            print("In disk cache.")
            await imageLoader.add(image, forKey: key)
            return image
        } catch {
            let image = try await imageLoader.image(key)
            try await store(image: image, forKey: key)
            return image
        }
    }

    func clear() async {
        for name in storedImagesIndex {
            try? await storage.remove(name: name)
        }
        storedImagesIndex.removeAll()
    }
}
