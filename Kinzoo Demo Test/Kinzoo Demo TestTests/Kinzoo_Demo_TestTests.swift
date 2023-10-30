//
//  Kinzoo_Demo_TestTests.swift
//  Kinzoo Demo TestTests
//
//  Created by Bhumit Muchhadia on 2023-10-29.
//

import XCTest
@testable import Kinzoo_Demo_Test

//let jsonString = """
//{
//    "info": {
//        "count": 826,
//        "pages": 42,
//        "next": "https://rickandmortyapi.com/api/character?page=2",
//        "prev": null
//    },
//    "results": [
//        {
//            "id": 1,
//            "name": "Rick Sanchez",
//            "status": "Alive",
//            "species": "Human",
//            "type": "",
//            "gender": "Male",
//            "origin": {
//                "name": "Earth (C-137)",
//                "url": "https://rickandmortyapi.com/api/location/1"
//            },
//            "location": {
//                "name": "Citadel of Ricks",
//                "url": "https://rickandmortyapi.com/api/location/3"
//            },
//            "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
//            "episode": [
//                "https://rickandmortyapi.com/api/episode/1",
//                "https://rickandmortyapi.com/api/episode/2",
//                // ... (other episode URLs)
//                "https://rickandmortyapi.com/api/episode/51"
//            ],
//            "url": "https://rickandmortyapi.com/api/character/1",
//            "created": "2017-11-04T18:48:46.250Z"
//        }
//    ]
//}
//"""
//if let jsonData = jsonString.data(using: .utf8) {
//    do {
//        let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: jsonData)
//        print(characterResponse)
//    } catch {
//        print("Error decoding JSON: \(error)")
//    }
//}
final class Kinzoo_Demo_TestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
