//
//  SchoolDirectoryAPI.swift
//  MagicTravel
//
//  Created by Dheeraj Agarwal on 15/08/23.
//

import Foundation

protocol CocktailProtocol {
    func getCocktailWithLetter(text: String, completion: @escaping (CocktailList?, DataError?) -> Void)
}

class CocktailService: CocktailProtocol {
    
    private struct Constants {
        static let url = "www.thecocktaildb.com/api/json/v1/1/search.php?s=a"
    }
    
    func getCocktailWithLetter(text: String, completion: @escaping (CocktailList?, DataError?) -> Void) {
        retrieveCocktailData(text: text, completion: {(data, error) in
            completion(data, error)
        })
    }
    
    private func createUrl(text: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "www.thecocktaildb.com"
        urlComponents.path = "/api/json/v1/1/search.php"
        urlComponents.queryItems = [URLQueryItem(name: "s", value: text)]
        return urlComponents.url
    }
    
    private func retrieveCocktailData(text: String, completion: @escaping (CocktailList?, DataError?) -> Void ) {
        
        if let url = createUrl(text: text) {
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                
                guard let data = data else {
                    print("error occured \(String(describing: error))")
                    completion(nil, .networkError(error.debugDescription))
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let cocktailData = try decoder.decode(CocktailList.self, from: data)
                    completion(cocktailData, nil)
                } catch let error {
                    print("error in decoding \(error.localizedDescription)")
                }
            }
            task.resume()
        }
    }
}
