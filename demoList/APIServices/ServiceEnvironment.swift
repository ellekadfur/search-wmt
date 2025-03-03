//
//  ServiceEnvironment.swift
//  demoList
//
//  Created by Elle Kadfur on 02/28/25.
//

import Foundation



enum ServiceEnviroment : String {
    
    case development
    
    func getApiUrl() -> String {
        switch self {
        case.development:
            return "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
        }
    }
    
}
