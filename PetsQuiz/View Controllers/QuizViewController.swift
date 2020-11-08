//
//  questionsTableViewController.swift
//  questionsScreen
//
//  Created by Владимир Падусов on 07.11.2020.
//

import UIKit


class QuizViewController: UITableViewController {
    
    // MARK: - Private Properties
    var chosenAnimal: PetType!
    private var questionsList: [Question] = []
    private var userAnswers: [Answer] = []
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        questionsList = Pet.getQuestions(for: chosenAnimal)
        setupAnswers()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC  = segue.destination as! ResultViewController
        resultVC.testResult = userAnswers
        resultVC.chosenPet = chosenAnimal
    }
    
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
    
    // MARK: - Private Methods
    private func setupAnswers() {
        for question in questionsList {
            userAnswers.append(Answer(question: question, isSelected: false))
        }
    }
    
    @objc func switchDidChange(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            userAnswers[sender.tag].isSelected = true
        case false:
            userAnswers[sender.tag].isSelected = false
        }
    }
}
