//
//  PetCollectionViewCell.swift
//  PetsQuiz
//
//  Created by User on 08.11.2020.
//  Copyright © 2020 Swiftbook. All rights reserved.
//

import UIKit

class PetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var petImageView: UIImageView!
    
    func configure(for petType: PetType) {
        petImageView.image = UIImage(named: petType.rawValue) ?? UIImage()
        petImageView.layer.cornerRadius = 15
    }
}
