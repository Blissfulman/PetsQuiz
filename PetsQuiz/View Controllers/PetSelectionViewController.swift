//
//  PetSelectionViewController.swift
//  PetsQuiz
//
//  Created by User on 06.11.2020.
//  Copyright © 2020 Swiftbook. All rights reserved.
//

import UIKit

class PetSelectionViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var petsCollectionView: UICollectionView!
    
    // MARK: - Properties
    private let petTypes = PetType.allCases
    private let columnNumber: CGFloat = 2
    private let spacing: CGFloat = 16
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        petsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as! QuizViewController
        guard let selectedIndexPath = petsCollectionView.indexPathsForSelectedItems else { return }
        guard let selectedItem = selectedIndexPath.first?.item else { return }
        let selectedPetType = petTypes[selectedItem]
        quizVC.chosenAnimal = selectedPetType
    }
}

// MARK: - CollectionViewDataSource
extension PetSelectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        petTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = petsCollectionView.dequeueReusableCell(
            withReuseIdentifier: "petCell", for: indexPath
            ) as! PetCollectionViewCell

        cell.configure(for: petTypes[indexPath.item])
        return cell
    }
}

// MARK: - CollectionViewLayout
extension PetSelectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = petsCollectionView.bounds.width
        let size = (collectionWidth - (spacing * (columnNumber - 1))) / columnNumber
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        spacing
    }
}
