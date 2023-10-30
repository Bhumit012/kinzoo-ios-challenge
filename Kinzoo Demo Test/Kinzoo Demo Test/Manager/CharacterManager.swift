//
//  CharacterManager.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import Foundation
import Reachability

// I have complicated relationship with singletons, but they work well with dependency injections
class CharacterDataManager {
    
    //MARK: Properties
    
    static let shared = CharacterDataManager()
    
    private var characters: [Character] = []
    private let userDefaults = UserDefaults.standard
    private let reachability = try? Reachability()
    
    func getCharacters() -> [Character] {
        return characters
    }
    
    func setCharacters(chars: [Character]) {
        characters = chars
    }
    
    //MARK: Functions
    
    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
            // Check if the network is reachable
        // pretty quick way to do this but it should work because alamo fire will cache the images.
            if let reachability = reachability, reachability.connection == .unavailable {
                // The internet is offload data from UserDefaults
                if let savedData = userDefaults.data(forKey: "bhumit0123"),
                    let decodedData = try? JSONDecoder().decode(CharacterResponse.self, from: savedData) {
                    completion(.success(decodedData.results))
                }
            }

            MyAPIClient.fetchCharacters { [weak self] result in
                switch result {
                case .success(let characterResponse):
                    // Save data to UserDefaults
                    self?.userDefaults.set(try? JSONEncoder().encode(characterResponse), forKey: "bhumit0123")

                    self?.characters = characterResponse.results

                    completion(.success(self?.characters ?? []))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
