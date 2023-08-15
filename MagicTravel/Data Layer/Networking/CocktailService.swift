//
//  SchoolDirectoryAPI.swift
//  MagicTravel
//
//  Created by Dheeraj Agarwal on 15/08/23.
//

import Foundation

protocol CocktailProtocol {
    func getCocktailWithLetter(text: String, completion: @escaping (CocktailList) -> Void)
}

class CocktailService: CocktailProtocol {
    
    private struct Constants {
        static let url = "www.thecocktaildb.com/api/json/v1/1/search.php"
    }
    
    func getCocktailWithLetter(text: String, completion: @escaping (CocktailList) -> Void) {
        retrieveCocktailData(text: text, completion: {data in
            completion(data)
        })
    }
    
    private func retrieveCocktailData(text: String, completion: @escaping (CocktailList) -> Void ) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "www.thecocktaildb.com"
        urlComponents.path = "/api/json/v1/1/search.php"
        urlComponents.queryItems = [URLQueryItem(name: "s", value: text)]
        
        if let url = urlComponents.url {
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                print("response is \(String(describing: response))")
                guard let data = data else {
                    print("error occured \(String(describing: error))")
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let cocktailData = try decoder.decode(CocktailList.self, from: data)
                    completion(cocktailData)
                } catch let error {
                    print("error in decoding \(error.localizedDescription)")
                }
                
            }
            task.resume()
        }
    }
}
