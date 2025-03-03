//
//  CountryModel.swift
//  demoList
//
//  Created by Elle Kadfur on 02/28/25.
//

import Foundation


struct CountryModel: Codable {
    let capital: String
    let code: String
    let currency: Currency
   
    let flag: String
    let language: Language
    let name: String
    let region: String
    
    enum CodingKeys: String, CodingKey {
        case capital
        case code
        case currency
        case flag
        case language
        case name
        case region
    }
}


struct Currency: Codable {
    let code: String
    let name: String
    let symbol: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case symbol
    }
}


struct Language: Codable {
    let code: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}

