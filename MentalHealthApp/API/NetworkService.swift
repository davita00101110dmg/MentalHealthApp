//
//  NetworkService.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 15.08.22.
//

import UIKit

//MARK: - Network Service

struct NetworkService {
    
    static let shared = NetworkService()
    
    private let session = URLSession.shared
    private let urlString = "https://api.quotable.io/random"
    private let endpoint = ["maxLength": "115",
                            "tags": "faith|future|happiness|motivational|philsophy|self-help"]

    func fetchQuotes() async -> Result<Quote, ApiError> {
        var urlComponents = URLComponents(string: urlString)
        
        var queryItems = [URLQueryItem]()
        
        for (name, value) in endpoint {
            queryItems.append(URLQueryItem(name: name, value: value))
        }
        
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            return .failure(.urlError)
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return .failure(.requestError)
            }
            let quotes = try JSONDecoder().decode(Quote.self, from: data)
            return .success(quotes)
        }
        
        catch {
            return .failure(.decodingError)
        }
    }
}
