//
//  TableCellInCollectionCell.swift
//  iOS10-HW14-Bessonov Ilia
//
//  Created by i0240 on 06.07.2023.
//

import UIKit

class TableCellInCollectionCell: UICollectionViewCell {

    static let identifier = "TableCellInCollectionCell"

    override var isSelected: Bool {
            didSet {
                UIView.animate(withDuration: 0.6) {
                    self.contentView.backgroundColor = self.isSelected ? .systemGray : .clear
                }
            }
        }

    // MARK: - Outlets

    private lazy var conteinerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()

    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGray4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubviews([conteinerView, iconImageView, nameLabel, numberLabel, arrowImageView])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            conteinerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            conteinerView.widthAnchor.constraint(equalToConstant: 27),
            conteinerView.heightAnchor.constraint(equalToConstant: 27),

            iconImageView.topAnchor.constraint(equalTo: conteinerView.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor),

            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            numberLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -10),
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configuration(model: PhotosModel) {
        self.iconImageView.image = UIImage(systemName: model.image)
        self.nameLabel.text = model.description
        self.numberLabel.text = String(Int.random(in: 0...1000))
        self.arrowImageView.image = UIImage(systemName: "chevron.right")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.iconImageView.image = nil
    }
}
