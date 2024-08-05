//
//  Response.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/4/24.
//

struct Response<T: Codable>: Codable {
    let meals: [T]
}
