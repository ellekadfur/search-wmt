//
//  APIServices.swift
//  demoList
//
//  Created by Elle Kadfur on 02/28/25.
//

import Foundation


class APIServices:NSObject {
    static let instance = APIServices()
    
    func getCountryList(onSuccess: @escaping([CountryModel]) -> Void, onFailure: @escaping(Error) -> Void)
    {
  
        let urlString:String = ServiceEnviroment.development.getApiUrl()
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                onFailure(error!)
                return
            }
            do {
                let countries = try JSONDecoder().decode([CountryModel].self, from: data)
                onSuccess(countries)
            } catch {
                print("Error decoding JSON: \(error)")
                onFailure(error)
            }
            
        }.resume()
    }
}
