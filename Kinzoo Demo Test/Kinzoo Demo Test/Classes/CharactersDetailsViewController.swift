//
//  CharactersViewController.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import UIKit
import SnapKit

class CharactersDetailsViewController: UIViewController {

    // MARK: Properties
    private let viewModel: CharacterDetailViewModel

    
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var characterStatusLabel: UILabel = {
        let label = UILabel()
        label.font = KinzooFonts.descriptionFont
        label.textColor = KinzooColors.secondaryFont
        return label
    }()

    private lazy var characterSpeciesLabel: UILabel = {
        let label = UILabel()
        label.font = KinzooFonts.descriptionFont
        label.textColor = KinzooColors.secondaryFont
        return label
    }()

    private lazy var episodesLabel: UILabel = {
        let label = UILabel()
        label.font = KinzooFonts.descriptionFontBold
        label.textColor = KinzooColors.secondaryFont
        label.text = Strings.epiTitle
        return label
    }()

    private lazy var episodesListTextView: UITextView = {
        let textView = UITextView()
        textView.font = KinzooFonts.descriptionFont
        textView.textColor = KinzooColors.secondaryFont
        textView.isEditable = false
        return textView
    }()

    // MARK: Init
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(characterImageView)
        
        view.addSubview(characterStatusLabel)
        view.addSubview(characterSpeciesLabel)
        view.addSubview(episodesLabel)
        view.addSubview(episodesListTextView)

        setupConstraints()

        if let character = viewModel.character {
            title = "\(character.name)'s Details"
            
            characterStatusLabel.text = "Status: \(character.status)"
            characterSpeciesLabel.text = "Species: \(character.species)"
            
//            let episodeStrings = character.episode.filter { url in
            let episodeStrings = character.episode.map { url in
                if let episodeNumber = URL(string: url)?.lastPathComponent {
                    return "Episode \(episodeNumber)"
                } else {
                    return "unkonwn episode"
                }
            }

            episodesListTextView.text = episodeStrings.joined(separator: "\n")
            
            characterImageView.af.setImage(withURL: URL(string: character.image)!)
        }
    }

    private func setupConstraints() {
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Constant.vertOffset)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(120)
        }

        characterStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).offset(Constant.vertOffset)
            make.leading.trailing.equalTo(view).inset(Constant.horizontalPadding)
        }

        characterSpeciesLabel.snp.makeConstraints { make in
            make.top.equalTo(characterStatusLabel.snp.bottom).offset(Constant.vertOffset)
            make.leading.trailing.equalTo(view).inset(Constant.horizontalPadding)
        }

        
        episodesLabel.snp.makeConstraints { make in
            make.top.equalTo(characterSpeciesLabel.snp.bottom).offset(Constant.vertOffset)
            make.leading.trailing.equalTo(view).inset(Constant.horizontalPadding)
        }

        episodesListTextView.snp.makeConstraints { make in
            make.top.equalTo(episodesLabel.snp.bottom).offset(Constant.vertOffset)
            make.leading.trailing.equalTo(view).inset(Constant.horizontalPadding)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


//MARK: Constants

fileprivate struct Strings {
    static let epiTitle =  NSLocalizedString("Episodes:", comment: "Episode title")
}

fileprivate struct Constant {
    static let horizontalPadding = 20
    static let vertOffset = 10
}
