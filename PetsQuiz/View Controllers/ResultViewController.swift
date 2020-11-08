//
//  ResultViewController.swift
//  PetsQuiz
//
//  Created by User on 07.11.2020.
//  Copyright © 2020 Swiftbook. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var defenitionLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    var testResult: [Answer]!
    var chosenPet: PetType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        (defenitionLabel.text, emojiLabel.text) = getOwnerDefenition()
    }

    @IBAction func goToMainScreenPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func getOwnerDefenition() -> (defenition: String, emoji: String) {
        
        var count = 0
        testResult.forEach { (answer) in
            count = answer.isSelected == answer.question.isGood ? 1 : -1
        }
        if count > 0 {
            return (chosenPet.definition.goodOwner, "😉")
        }
        return (chosenPet.definition.badOwner, "☹️")
    }
}
