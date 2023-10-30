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
           tableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
           return tableView
       }()

       private let viewModel: CharactersViewModel

       //MARK: Init
       
       init(viewModel: CharactersViewModel) {
           self.viewModel = viewModel
           super.init(nibName: nil, bundle: nil)
           
           self.title = Strings.headerTitle
       }
       
       required init?(coder aDecoder: NSCoder) {
           let viewModel = CharactersViewModel(characterDataManager: CharacterDataManager.shared)
             self.viewModel = viewModel
           super.init(coder: aDecoder)
       }
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = KinzooColors.appBgColor
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        let character = viewModel.characters[indexPath.row]
        cell.selectionStyle = .none
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

fileprivate struct Strings {
    static let headerTitle =  NSLocalizedString("Wubba-lubba-dub-dub!", comment: "Title of the page")
}
