//
//  QuoteCellModel.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 02.09.22.
//

// MARK: - Quote

struct Quote: Decodable {
    let _id: String
    let content: String
    let author: String
    let length: Int
}
