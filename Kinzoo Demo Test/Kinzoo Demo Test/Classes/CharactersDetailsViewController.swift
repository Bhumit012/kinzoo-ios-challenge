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

    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = KinzooFonts.nameFont
        label.textColor = KinzooColors.regularFont
        return label
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
        label.font = KinzooFonts.descriptionFont
        label.textColor = KinzooColors.secondaryFont
        label.text = "Episodes:"
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
        view.addSubview(characterNameLabel)
        view.addSubview(characterStatusLabel)
        view.addSubview(characterSpeciesLabel)
        view.addSubview(episodesLabel)
        view.addSubview(episodesListTextView)

        setupConstraints()

        if let character = viewModel.character {
            title = "\(character.name)'s Details"
            characterNameLabel.text = character.name
            characterStatusLabel.text = "Status: \(character.status)"
            characterSpeciesLabel.text = "Species: \(character.species)"
            episodesListTextView.text = character.episode.joined(separator: "\n")
            characterImageView.af.setImage(withURL: URL(string: character.image)!)
        }
    }

    private func setupConstraints() {
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(120)
        }

        characterNameLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view).inset(20)
        }

        characterStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(characterNameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view).inset(20)
        }

        characterSpeciesLabel.snp.makeConstraints { make in
            make.top.equalTo(characterStatusLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view).inset(20)
        }

        episodesLabel.snp.makeConstraints { make in
            make.top.equalTo(characterSpeciesLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view).inset(20)
        }

        episodesListTextView.snp.makeConstraints { make in
            make.top.equalTo(episodesLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
