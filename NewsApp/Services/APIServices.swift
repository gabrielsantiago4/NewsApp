//
//  ApiServices.swift
//  NewsApp
//
//  Created by Gabriel Santiago on 13/05/24.
//

import Foundation

struct APIServices {
    
    func getTopHeadlines(from country: String, completion: @escaping (TopHeadlines) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=56b8821ee5e44e5395c21aaa374c13bc") else {
            return
        }
        let request = URLRequest(url: url)
        
        let session = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let requestedData = data else { return }
            
            do{
                let decodedData = try JSONDecoder().decode(TopHeadlines.self, from: requestedData)
                completion(decodedData)
            } catch {
                print(error)
            }
        }
        session.resume()
    }
    
    
}
