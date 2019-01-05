//
//  NetworkLayer.swift
//  TheForce
//
//  Created by Vania Radmila Alfitri on 05/01/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import Foundation

//1 Make http request
struct NetworkLayer {
    func fetchMovies(successHandler: @escaping (StarWars?) -> Void, errorHandler: @escaping (Error) -> Void) {
        let session = URLSession.shared
        
        //Making http request
        var urlRequest = URLRequest(url: URL(string: "https://swapi.co/api/people/")!)
        session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else{
//                DispatchQueue.main.async {
//                    errorHandler(APIError.serverError)
//                }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else{
//                DispatchQueue.main.async {
//                    errorHandler(APIError.invalidResponseCode)
//                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    errorHandler(NSError(domain: "", code: 0, userInfo: nil))
                }
                return
            }
            
            //Decoding
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let movies = try jsonDecoder.decode(StarWars.self, from: data)
                
                //change thread to main
                DispatchQueue.main.async {
                    successHandler(movies)
                }
                
            } catch {
//                errorHandler(APIError.invalidJSONParsing)
            }
            }.resume()
    }
}



