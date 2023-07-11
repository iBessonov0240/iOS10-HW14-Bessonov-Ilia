//
//  PhotoesModel.swift
//  iOS10-HW14-Bessonov Ilia
//
//  Created by i0240 on 05.07.2023.
//

import Foundation

struct PhotosModel: Hashable {
    var image: String
    var description: String?
    var favoriteImage: String?
    var subtitle: String?
}

extension PhotosModel {
    static let modelsArray = [
        [PhotosModel(image: "photo1", description: "Recents"),
         PhotosModel(image: "photo2", description: "Favorites", favoriteImage: "heart.fill"),
         PhotosModel(image: "photo3", description: "Family Reunion"),
         PhotosModel(image: "photo4", description: "Idara Ekpoh"),
         PhotosModel(image: "photo5", description: "Instagram"),
         PhotosModel(image: "photo6", description: "WhatsApp"),
         PhotosModel(image: "photo7", description: "InstaSize")
        ],
        [PhotosModel(image: "photo7", description: "For all", subtitle: "From You"),
         PhotosModel(image: "photo6", description: "For me", subtitle: "From Someone"),
         PhotosModel(image: "photo5", description: "Family", subtitle: "From You"),
         PhotosModel(image: "photo4", description: "Shared", subtitle: "From Someone"),
         PhotosModel(image: "photo3", description: "Instagram", subtitle: "From You"),
         PhotosModel(image: "photo2", description: "WhatsApp", subtitle: "From Someone"),
         PhotosModel(image: "photo1", description: "InstaSize", subtitle: "From You")
        ],
        [PhotosModel(image: "video", description: "Videos"),
         PhotosModel(image: "person.crop.square", description: "Selfies"),
         PhotosModel(image: "livephoto", description: "Live Photos"),
         PhotosModel(image: "cube", description: "Portrait"),
         PhotosModel(image: "camera.viewfinder", description: "Screenshots"),
         PhotosModel(image: "record.circle", description: "Screen Recordings")
        ],
        [PhotosModel(image: "arrow.down.square", description: "Imports"),
         PhotosModel(image: "eye.slash", description: "Hidden"),
         PhotosModel(image: "trash", description: "Recently Deleted")
        ]
    ]
}
