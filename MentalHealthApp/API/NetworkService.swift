//
//  NetworkService.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 15.08.22.
//

import UIKit

//MARK: - Network Service

struct NetworkService {
    private let session = URLSession.shared
    private let urlString = "https://api.quotable.io/random"
    private let query = ["maxLength": "115",
                            "tags": "faith|future|happiness|motivational|philsophy|self-help"]

    func fetchQuotes<T: Decodable>(decodingType: T.Type) async throws -> T {
        var urlComponents = URLComponents(string: urlString)
        var queryItems = [URLQueryItem]()
        
        for (name, value) in query {
            queryItems.append(URLQueryItem(name: name, value: value))
        }
        
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            throw ApiError.urlError
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw ApiError.requestError
            }
            let quotes = try JSONDecoder().decode(decodingType.self, from: data)
            return quotes
        }
        
        catch {
            throw ApiError.decodingError
        }
    }
}
