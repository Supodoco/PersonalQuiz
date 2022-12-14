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
        var maxValue = 1
        var animal: Animal = .dog
        answersChosen.forEach {
            if let x = answers[$0.animal] {
                answers[$0.animal] = x + 1
                if x + 1  > maxValue {
                    maxValue = x + 1
                    animal = $0.animal
                }
            } else {
                answers[$0.animal] = 1
            }
        }
        return animal
    }
    
}
