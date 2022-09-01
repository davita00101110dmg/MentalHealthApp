//
//  NetworkError.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 02.09.22.
//

import Foundation

// MARK: - API Error

enum ApiError: String, Error {
    case urlError = "Invalid URL"
    case requestError = "Request error"
    case decodingError = "Error while decoding JSON"
}
