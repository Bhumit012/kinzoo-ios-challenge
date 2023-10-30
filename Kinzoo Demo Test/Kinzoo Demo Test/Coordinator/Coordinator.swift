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
    func navigateTo(_ viewController: UIViewController)
    func childDidFinish(_ childCoordinator: Coordinator)
}

extension Coordinator {
    func navigateTo(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }

    func childDidFinish(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
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
          let charactersViewModel = CharactersViewModel()
        
        // inject the dependencies
        let mainViewController = CharactersViewController(viewModel: charactersViewModel)
          navigateTo(mainViewController)
      }
}
