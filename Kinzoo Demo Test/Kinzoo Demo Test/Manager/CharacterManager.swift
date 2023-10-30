//
//  CharacterManager.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import Foundation

// I have complicated relationship with singletons, but they work well with dependency injections
class CharacterDataManager {
    
    //MARK: Properties
    
    static let shared = CharacterDataManager()
    
    private var characters: [Character] = []
    
    func setCharacters(_ characters: [Character]) {
        self.characters = characters
    }
    
    func getCharacters() -> [Character] {
        return characters
    }
    
    
    //MARK: Functions
    
    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        MyAPIClient.fetchCharacters { [weak self] result in
            switch result {
            case .success(let characterResponse):
                self?.characters = characterResponse.results

                completion(.success(self?.characters ?? []))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
