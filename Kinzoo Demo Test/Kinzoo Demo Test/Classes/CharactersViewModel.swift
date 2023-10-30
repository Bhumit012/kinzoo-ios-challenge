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

final class CharactersViewModel {
    
    //MARK: Properties
    
    weak var delegate: CharactersViewModelDelegate?
    let characterDataManager: CharacterDataManager
    
    // this can be imporved further by calling API when getCharacters() is empty instead of doing it manualy like below.
    var characters: [Character] {
        return characterDataManager.getCharacters()
    }
    
    init(characterDataManager: CharacterDataManager) {
        self.characterDataManager = characterDataManager
    }
    
    // weak self on callbacks
    func fetchCharacters() {
        characterDataManager.fetchCharacters { [weak self] result in
            switch result {
            case .success:
                self?.delegate?.didFetchCharacters()
            case .failure(let error):
                self?.delegate?.didFailWithError(error)
            }
        }
    }
}
