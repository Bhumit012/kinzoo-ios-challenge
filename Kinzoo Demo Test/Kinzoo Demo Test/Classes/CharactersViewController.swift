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
    
    private let cellID = "CharacterCell"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    private let viewModel: CharactersViewModel
    private let coordinator: MainCoordinator?
    
    
    //MARK: Init
    
    init(viewModel: CharactersViewModel,
         coordinator: MainCoordinator?) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = Strings.headerTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = KinzooColors.appBgColor
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        
        viewModel.delegate = self
        viewModel.fetchCharacters()
    }
}


extension CharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
    
}

extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CharacterCell
        let character = viewModel.characters[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(with: character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.row]
        
        if let coordinator = coordinator {
            coordinator.navigateToCharacterDetailsVC(charID: character.id)
        }
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


//MARK: Strings

fileprivate struct Strings {
    static let headerTitle =  NSLocalizedString("Wubba-lubba-dub-dub!", comment: "Title of the page")
}
