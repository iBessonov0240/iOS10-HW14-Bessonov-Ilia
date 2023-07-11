//
//  ViewController.swift
//  iOS10-HW14-Bessonov Ilia
//
//  Created by i0240 on 05.07.2023.
//

import UIKit

class ViewController: UIViewController {

//    enum SectionType: Int, CaseIterable {
//        case first = 0
//        case second = 1
//        case third = 2
//        case four = 3
//    }

    // MARK: - Outlets

    private lazy var photoCollectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        registerCells()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func registerCells() {
        photoCollectionView.register(
            SimpleCellHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SimpleCellHeader.identifier
        )
        photoCollectionView.register(
            LabelAndButtonCellHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: LabelAndButtonCellHeader.identifier
        )
        photoCollectionView.register(
            MyAlbumsCell.self,
            forCellWithReuseIdentifier: MyAlbumsCell.identifier
        )
        photoCollectionView.register(
            SharedAlbumsCell.self,
            forCellWithReuseIdentifier: SharedAlbumsCell.identifier
        )
        photoCollectionView.register(
            TableCellInCollectionCell.self,
            forCellWithReuseIdentifier: TableCellInCollectionCell.identifier
        )
    }

    private func setupHierarchy() {
        view.addSubview(photoCollectionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            photoCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - CollectionViewLayout

    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (moduleSection, _) -> NSCollectionLayoutSection in
            let section = SectionType(rawValue: moduleSection)
            switch section {
            case .first:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let layoutItem = NSCollectionLayoutItem(
                    layoutSize: itemSize
                )
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 0,
                    bottom: 5,
                    trailing: 0
                )
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1 / 2.2),
                    heightDimension: .fractionalWidth(1 / 1.7 * 2)
                )
                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitem: layoutItem,
                    count: 2
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 10,
                    bottom: 0,
                    trailing: 0
                )
                let layoutSection = NSCollectionLayoutSection(
                    group: layoutGroup
                )
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 10,
                    leading: 10,
                    bottom: 0,
                    trailing: 0
                )
                layoutSection.orthogonalScrollingBehavior = .groupPaging

                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

                return layoutSection
            case .second:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                    heightDimension: .fractionalHeight(1)
                )
                let layoutItem = NSCollectionLayoutItem(
                    layoutSize: itemSize
                )
                layoutItem.contentInsets = .init(
                    top: 10,
                    leading: 10,
                    bottom: 10,
                    trailing: 10
                )
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1 / 1.6)
                )
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [layoutItem]
                )
                let layoutSection = NSCollectionLayoutSection(
                    group: layoutGroup
                )
                layoutSection.orthogonalScrollingBehavior = .continuous

                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 20,
                    trailing: 0
                )
                return layoutSection
            case .third:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let layoutItem = NSCollectionLayoutItem(
                    layoutSize: itemSize
                )
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 5,
                    bottom: 5,
                    trailing: 0
                )
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(44)
                )
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [layoutItem]
                )
                let layoutSection = NSCollectionLayoutSection(
                    group: layoutGroup
                )
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 50,
                    leading: 10,
                    bottom: 50,
                    trailing: 10
                )
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 20,
                    trailing: 0
                )
                return layoutSection
            case .four:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let layoutItem = NSCollectionLayoutItem(
                    layoutSize: itemSize
                )
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 5,
                    bottom: 5,
                    trailing: 0
                )
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(44)
                )
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [layoutItem]
                )
                let layoutSection = NSCollectionLayoutSection(
                    group: layoutGroup
                )
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 50,
                    leading: 10,
                    bottom: 50,
                    trailing: 10
                )
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 20,
                    trailing: 0
                )
                return layoutSection
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let layoutItem = NSCollectionLayoutItem(
                    layoutSize: itemSize
                )
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 5,
                    bottom: 5,
                    trailing: 0
                )
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(44)
                )
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [layoutItem]
                )
                let layoutSection = NSCollectionLayoutSection(
                    group: layoutGroup
                )
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 50,
                    leading: 10,
                    bottom: 50,
                    trailing: 10
                )
                return layoutSection
            }
        }
        return layout
    }
}

// MARK: - CollectionViewDelegate

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return PhotosModel.modelsArray[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = SectionType(rawValue: indexPath.section)
        switch section {
        case .first:
            guard let item = collectionView.dequeueReusableCell(
                withReuseIdentifier: MyAlbumsCell.identifier,
                for: indexPath) as? MyAlbumsCell else {
                return UICollectionViewCell()
            }
            item.configuration(model: PhotosModel.modelsArray[indexPath.section][indexPath.item])

            return item
        case .second:
            guard let item = collectionView.dequeueReusableCell(
                withReuseIdentifier: SharedAlbumsCell.identifier,
                for: indexPath) as? SharedAlbumsCell else {
                return UICollectionViewCell()
            }
            item.configuration(model: PhotosModel.modelsArray[indexPath.section][indexPath.item])

            return item
        case .third:
            guard let item = collectionView.dequeueReusableCell(
                withReuseIdentifier: TableCellInCollectionCell.identifier,
                for: indexPath) as? TableCellInCollectionCell else {
                return UICollectionViewCell()
            }
            item.configuration(model: PhotosModel.modelsArray[indexPath.section][indexPath.item])

            return item
        case .four:
            guard let item = collectionView.dequeueReusableCell(
                withReuseIdentifier: TableCellInCollectionCell.identifier,
                for: indexPath) as? TableCellInCollectionCell else {
                return UICollectionViewCell()
            }
            item.configuration(model: PhotosModel.modelsArray[indexPath.section][indexPath.item])

            return item
        default:
            guard let item = collectionView.dequeueReusableCell(
                withReuseIdentifier: SharedAlbumsCell.identifier,
                for: indexPath) as? SharedAlbumsCell else {
                return UICollectionViewCell()
            }

            return item
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = SectionType(rawValue: indexPath.section)
        switch section {
        case .first:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: LabelAndButtonCellHeader.identifier,
                for: indexPath) as? LabelAndButtonCellHeader else {
                return UICollectionViewCell()
            }
            header.title.text = "My Albums"

            return header
        case .second:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: LabelAndButtonCellHeader.identifier,
                for: indexPath) as? LabelAndButtonCellHeader else {
                return UICollectionViewCell()
            }
            header.title.text = "Shared Albums"

            return header
        case .third:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SimpleCellHeader.identifier,
                for: indexPath) as? SimpleCellHeader else {
                return UICollectionViewCell()
            }
            header.title.text = "Media Types"

            return header
        case .four:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SimpleCellHeader.identifier,
                for: indexPath) as? SimpleCellHeader else {
                return UICollectionViewCell()
            }
            header.title.text = "Utilities"

            return header
        default:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SimpleCellHeader.identifier,
                for: indexPath) as? SimpleCellHeader else {
                return UICollectionViewCell()
            }
            header.title.text = ""

            return header
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return PhotosModel.modelsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You push to \(PhotosModel.modelsArray[indexPath.section][indexPath.item].description ?? "") item...")
    }
}
