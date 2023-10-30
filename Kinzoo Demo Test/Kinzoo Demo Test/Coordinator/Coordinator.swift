//
//  Coordinator.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func navigateToCharactersVC()
    func navigateToCharacterDetailsVC(charID: Int)
    func navigateTo(_ viewController: UIViewController)
}

extension Coordinator {
    func navigateTo(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}

final class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func navigateToCharactersVC() {
        
        // Create and set up the CharactersViewModel
        let charactersViewModel = CharactersViewModel(characterDataManager: CharacterDataManager.shared)
        
        // inject the dependencies
        let mainViewController = CharactersViewController(viewModel: charactersViewModel,
                                                          coordinator: self)

        DispatchQueue.main.async { [weak self] in
            self?.navigateTo(mainViewController)
        }
    }
    
    func navigateToCharacterDetailsVC(charID: Int) {
        let charactersDetailViewModel = CharacterDetailViewModel(characterDataManager: CharacterDataManager.shared)
        charactersDetailViewModel.currentCharID = charID
        
        // inject the dependencies
        let detailViewController = CharactersDetailsViewController(viewModel: charactersDetailViewModel)
        
        DispatchQueue.main.async { [weak self] in
            self?.navigateTo(detailViewController)
        }
    }
}
