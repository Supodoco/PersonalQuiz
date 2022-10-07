//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let result = getResult()
        resultLabel.text = "Вы - \(result.rawValue)"
        definitionLabel.text = result.definition

    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func getResult() -> Animal {
        var answers: [Animal: Int] = [:]
        answersChosen.forEach {
            if let _ = answers[$0.animal] {
                answers[$0.animal]! += 1
            } else {
                answers[$0.animal] = 1
            }
        }
        var maxValue = 0
        var animal: Animal = .dog
        answers.forEach {
            if $0.value > maxValue {
                maxValue = $0.value
                animal = $0.key
            }
        }
        return animal
    }
    
}
