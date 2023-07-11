//
//  LabelAndButtonCellHeader.swift
//  iOS10-HW14-Bessonov Ilia
//
//  Created by i0240 on 05.07.2023.
//

import UIKit

class LabelAndButtonCellHeader: UICollectionReusableView {

    static let identifier = "LabelAndButtonCellHeader"

    // MARK: - Outlets

    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See All", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(seeAllButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubviews([title, seeAllButton])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),

            seeAllButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }

    // MARK: - Actions

    @objc private func seeAllButtonPressed() {
        print("See all button pressed")
    }
}
