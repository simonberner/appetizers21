//
//  NetworkManager.swift
//  Appetizers21
//
//  Created by Simon Berner on 25.11.21.
//

import Foundation

// singelton
final class NetworkManager {
    static let shared = NetworkManager()

    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    // endpoint
    private let appetizerURL = baseURL + "appetizers"

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
}
