//
//  RemoteImage.swift
//  Appetizers21
//
//  Created by Simon Berner on 29.11.21.
//

import SwiftUI

// Downloads the image and broadcasts its image change
final class ImageLoader: ObservableObject {

    @Published var image: Image? = nil

    // 2nd: make the network-call to get the image
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else {return}
            // on the main queue we trigger the UI update
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct AppetizerRemoteImage: View {

    // listening for changes on the imageLoader
    @StateObject var imageLoader = ImageLoader()
    let urlString: String

    var body: some View {
        // 3rd: when the imageLoader redraws this view, it initialises
        // the RemoteImage with an image
        RemoteImage(image: imageLoader.image)
            // 1st: is called when the AppetizerRemoteImage appears on screen
            .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}

// Helper to make the code of the above AppetizerRemoteImage clean
struct RemoteImage: View {

    var image: Image?

    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}
