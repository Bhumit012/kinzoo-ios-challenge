//
//  CharactersViewModel.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import Foundation


final class CharacterDetailViewModel {
    
    //MARK: Properties

    let characterDataManager: CharacterDataManager
    var currentCharID:Int = 0

    var character: Character? {
        return characterDataManager.getCharacters().first { $0.id == currentCharID }
    }
    
    init(characterDataManager: CharacterDataManager) {
        self.characterDataManager = characterDataManager
    }
}
