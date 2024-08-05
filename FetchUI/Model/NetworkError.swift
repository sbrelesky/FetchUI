//
//  NetworkError.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/4/24.
//

enum NetworkError: Error {
    case badURL
    case requestFailed
    case decodingFailed
}
