//
//  CharactersViewModel.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import Foundation

protocol CharactersViewModelDelegate: AnyObject {
    func didFetchCharacters()
    func didFailWithError(_ error: Error)
}

class CharactersViewModel {
    weak var delegate: CharactersViewModelDelegate?

    var characters: [Character] = []

    func fetchCharacters() {
        MyAPIClient.fetchData { result in
            
            switch result {
            case .success(let response):
                self.characters = response.results
                
                    self.delegate?.didFetchCharacters()
            case .failure(let error):
                self.delegate?.didFailWithError(error)
            }
        }
    }
}
