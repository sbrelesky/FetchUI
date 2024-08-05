//
//  Measurement.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/4/24.
//

struct Measurement: Codable {
    let primaryValue: String
    let secondaryValue: String?
    
    var formatted: String {
        if let secondary = secondaryValue {
            return "\(primaryValue) (\(secondary))"
        } else {
            return primaryValue
        }
    }
    
    init(measurementString: String) {
        let components = measurementString
            .cleanFractionForString()
            .replacingOccurrences(of: "tablespoon", with: "tbsp")
            .replacingOccurrences(of: "teaspoon", with: "tsp")
            .replacingOccurrences(of: "g\\/", with: "g/")
            .split(separator: "g/")
        
        self.primaryValue = String(components[0])
        self.secondaryValue = components.count > 1 ? String(components[1]) : nil
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.primaryValue = try container.decode(String.self, forKey: .primaryValue)
        self.secondaryValue = try container.decodeIfPresent(String.self, forKey: .secondaryValue)
    }
}
