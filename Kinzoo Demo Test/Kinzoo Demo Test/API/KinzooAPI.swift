//
//  KinzooAPI.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import Foundation
import Alamofire

struct MyAPIClient {
    static let baseURL = "https://rickandmortyapi.com/api"
    
    enum Endpoints {
        case character
        
        var path: String {
            switch self {
            case .character:
                return MyAPIClient.baseURL + "/character"
            }
        }
    }
    
    static func fetchCharacters(completion: @escaping (Result<CharacterResponse, Error>) -> Void) {
        let endpoint = Endpoints.character.path
        
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
