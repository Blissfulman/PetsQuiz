//
//  questionsTableViewController.swift
//  questionsScreen
//
//  Created by Владимир Падусов on 07.11.2020.
//

import UIKit

private var chosenAnimal: PetType!
private var questionsList: [Question] = []
private var countedResult: Int = 0

class questionsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsList = Pet.getQuestions(for: chosenAnimal)
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let resultVC  = segue.destination as! ResultViewController
    //        resultVC.testResult = countedResult
    //    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questionsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "question", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let question = questionsList[indexPath.row]
        
        content.text = question.text
        
        cell.contentConfiguration = content
        
        cell.textLabel?.numberOfLines = 0
        
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchDidChange(_:)), for: .valueChanged)
        cell.accessoryView = switchView
        
        return cell
    }
    
    @objc func switchDidChange(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            if questionsList[sender.tag].isGood {
                countedResult += 1
            } else {
                countedResult -= 1 }
        case false:
            if questionsList[sender.tag].isGood {
                countedResult -= 1
            } else {
                countedResult += 1
            }
            
        }
    }
}
