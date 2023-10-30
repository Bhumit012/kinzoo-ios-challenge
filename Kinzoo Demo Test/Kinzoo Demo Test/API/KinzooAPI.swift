//
//  KinzooAPI.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import Foundation
import Alamofire

enum MyAPIClient {
    static let baseURL = "https://rickandmortyapi.com/api"

    enum Endpoints {
        case fetchData

        var stringValue: String {
            switch self {
            case .fetchData:
                return MyAPIClient.baseURL + "/character"
            }
        }
    }

    static func fetchData(completion: @escaping (Result<CharacterResponse, Error>) -> Void) {
        let endpoint = Endpoints.fetchData.stringValue

        AF.request(endpoint).responseDecodable(of: CharacterResponse.self) { response in
            
            switch response.result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
