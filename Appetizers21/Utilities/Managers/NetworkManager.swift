//
//  NetworkManager.swift
//  Appetizers21
//
//  Created by Simon Berner on 25.11.21.
//

import UIKit

// singelton
final class NetworkManager {

    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>() // Key, Value

    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    // endpoint
    let appetizerURL = baseURL + "appetizers"

    private init () {}

    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return // return in case of an invalidURL
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return // return in case of eg. wifi is not working
            }

            // if response is not nil, cast it as HTTPURLResponse and take that response we got and check if
            // the status code of it is equal to 200 (OK)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // if we don't get a response OR a status code other than 200, return an error
                completed(.failure(.invalidResponse))
                return
            }

            // check that data is not nil
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            // now we have good data
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }

    // 1st: pass in an urlString to the image
    // 2nd: the network call is going to return a closure which has an UIImage or nil
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {

        let cacheKey = NSString(string: urlString)

        // check the cache before we download the image
        if let image = cache.object(forKey: cacheKey) {
            completed(image) // call completed return the image
            return
        }

        // check the passed in url
        guard let url = URL(string: urlString) else {
            completed(nil) // call the completion hander
            return
        }

        // create the network call (we don't care about an error)
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [self] data, response, error in

            // if we have data AND we can initialise an image from that data
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }

            // if we then have the image, set it into the cache
            cache.setObject(image, forKey: cacheKey)
            completed(image) // call the completion hander
        }

        task.resume() // resolve the network call
    }
}
