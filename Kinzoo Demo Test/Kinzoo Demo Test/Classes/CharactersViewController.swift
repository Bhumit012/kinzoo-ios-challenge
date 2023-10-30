//
//  CharactersViewController.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import UIKit
import SnapKit

final class CharactersViewController: UIViewController {
    
    //MARK: Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CharacterCell")
        return tableView
    }()

    private let viewModel: CharactersViewModel

    
    //MARK: Init
    
    init(viewModel: CharactersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CharacterCell")
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        viewModel.delegate = self
        viewModel.fetchCharacters()
    }
}

extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
            let character = viewModel.characters[indexPath.row]
            cell.configure(with: character)
            return cell
        }
}

extension CharactersViewController: CharactersViewModelDelegate {
    func didFetchCharacters() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func didFailWithError(_ error: Error) {
        
        // show alert hre
        print("Err: \(error.localizedDescription)")
    }
}
