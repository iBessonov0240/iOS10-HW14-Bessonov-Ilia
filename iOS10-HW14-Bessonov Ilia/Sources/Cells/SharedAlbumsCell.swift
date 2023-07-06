//
//  SharedAlbumsCell.swift
//  iOS10-HW14-Bessonov Ilia
//
//  Created by i0240 on 05.07.2023.
//

import UIKit

class SharedAlbumsCell: UICollectionViewCell {

    static let identifier = "SharedAlbumsCell"

    // MARK: - Outlets

    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var catalogName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var numberOfPhotoes: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        contentView.addSubviews([image, catalogName, numberOfPhotoes])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            catalogName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            catalogName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

            numberOfPhotoes.topAnchor.constraint(equalTo: catalogName.bottomAnchor, constant: 3),
            numberOfPhotoes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

            image.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
    }

    func configuration(model: PhotosModel) {
        self.image.image = UIImage(named: model.image)
        self.catalogName.text = model.description
        self.numberOfPhotoes.text = model.subtitle
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}
