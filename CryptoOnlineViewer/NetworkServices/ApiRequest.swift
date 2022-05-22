//
//  ApiRequest.swift
//  CryptoOnlineViewer
//
//  Created by user on 18/5/22.
//

import Foundation

class ApiRequest {
    
    let urlString = "https://api.nomics.com/v1/currencies/ticker?key=b31e62c7ce2a16593f69e6b9bef518f1ee5d0a5a&interval=1d,30d&convert=USD"

    var apiKey = "b31e62c7ce2a16593f69e6b9bef518f1ee5d0a5a"
    
    func request(urlString: String,completion: @escaping (Result<Data,Error>) -> Void) {

        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    completion(.failure(error))

                    return
                }

                guard let data = data else {
                    return
                }

                print(data)
                completion(.success(data))
            }
        }.resume()
    }
}
