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
    private let endpoint = ["maxLength": "115",
                            "tags": "faith|future|happiness|motivational|philsophy|self-help"]

    func fetchQuotes() async throws -> Quote {
        var urlComponents = URLComponents(string: urlString)
        var queryItems = [URLQueryItem]()
        
        for (name, value) in endpoint {
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
            let quotes = try JSONDecoder().decode(Quote.self, from: data)
            return quotes
        }
        
        catch {
            throw ApiError.decodingError
        }
    }
}
