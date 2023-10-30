//
//  CharacterCell.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import UIKit
import SnapKit
import AlamofireImage

final class CharacterCell: UITableViewCell {
    
    
    // MARK: UI properties
    // i like computed lazy properties
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = KinzooFonts.cellNameFont
        label.textColor = KinzooColors.regularFont
        
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(characterImageView)
        contentView.addSubview(characterNameLabel)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
    }
    
    // MARK: Config
    
    func configure(with character: Character) {
        characterNameLabel.text = character.name

        if let imageURL = URL(string: character.image) {
            characterImageView.af.setImage(withURL: imageURL)
        }
    }

    private func setupConstraints() {
        characterImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(16)
            make.centerY.equalTo(contentView)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }

        characterNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(characterImageView.snp.trailing).offset(16)
            make.trailing.equalTo(contentView).offset(-16)
            make.centerY.equalTo(contentView)
        }
    }
}
