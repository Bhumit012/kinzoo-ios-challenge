//
//  SnapShotTestCharList.swift
//  Kinzoo Demo TestTests
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import XCTest
import SwiftUI
@testable import Kinzoo_Demo_Test
import SnapshotTesting

final class SnapShotTestCharListtDetails: XCTestCase {
    var dataModel = CharacterDataManager.shared
    
    var vc: CharactersViewController!
    
    override func setUpWithError() throws {
        isRecording = false // Set to true to record snapshots
        
        // Mock data for Location
        let earthLocation = Location(name: "Earth", url: "https://earth.example.com")
        let originLocation = Location(name: "Origin Location", url: "https://origin.example.com")
        let locationLocation = Location(name: "Location Location", url: "https://location.example.com")
        
        // Mock data for Character
        let character1 = Character(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: earthLocation,
            location: locationLocation,
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
            ],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
        
        let character2 = Character(
            id: 2,
            name: "Morty Smith",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: originLocation,
            location: locationLocation,
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
            ],
            url: "https://rickandmortyapi.com/api/character/2",
            created: "2017-11-04T18:50:21.651Z"
        )
        
        // Mock data for CharacterResponse
        let characterResponse = CharacterResponse(
            info: Info(count: 2, pages: 1, next: "https://next-page.example.com", prev: nil),
            results: [character1, character2]
        )
        
        dataModel.setCharacters(chars: characterResponse.results)
        var vm = CharactersViewModel(characterDataManager: dataModel)
        vc = CharactersViewController(viewModel: vm, coordinator: nil)
        
        vc.loadView()
        vc.viewDidLoad()
    }
    
    override func tearDownWithError() throws {
     vc = nil
     CharacterDataManager.shared.setCharacters(chars: [])
    }
    
    func testExampleCharactersList() throws {

        assertSnapshot(
            matching: vc.view,
            as: .wait(for: 0.5, on: .image))
    }
}



