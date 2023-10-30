//
//  CharactersViewController.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import UIKit
import SnapKit

final class CharactersDetailsViewController: UIViewController {
    
    //MARK: Properties
    

    private let viewModel: CharactersDetailsViewModel

    
    //MARK: Init
    
    init(viewModel: CharactersDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
}
