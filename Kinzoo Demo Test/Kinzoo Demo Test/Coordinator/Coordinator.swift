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
    
    func start()
    func startToCharacterDetails()
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
    
    func start() {
        
        // Create and set up the CharactersViewModel
        let charactersViewModel = CharactersViewModel(characterDataManager: CharacterDataManager.shared)
        
        // inject the dependencies
        let mainViewController = CharactersViewController(viewModel: charactersViewModel)
        
        //navigationController.setViewControllers([mainViewController], animated: true)
        DispatchQueue.main.async { [weak self] in
            self?.navigateTo(mainViewController)
        }
    }
    
    func startToCharacterDetails() {
        // Create and set up the CharactersViewModel
        let charactersDetailViewModel = CharacterDetailViewModel(characterDataManager: CharacterDataManager.shared)
        
        // inject the dependencies
        let detailViewController = CharactersDetailsViewController(viewModel: charactersDetailViewModel)
        
        DispatchQueue.main.async { [weak self] in
            self?.navigateTo(detailViewController)
        }
    }
}
