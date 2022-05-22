//
//  ApiResponse.swift
//  CryptoOnlineViewer
//
//  Created by user on 18/5/22.
//

import Foundation

class ApiResponse {

    var requests = ApiRequest()

    func response(urlString: String, responses: @escaping ([CryptosModel?]) -> Void) {
        requests.request(urlString: urlString) { (result) in
            switch result {

            case .success(let data):
                do {
                    let model = try JSONDecoder().decode([CryptosModel].self, from: data)
                    responses(model)
                } catch let jsonerror {
                    print(jsonerror)
                }
            case .failure(_):
                responses([nil])
            }
        }

    }
}
