//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 高橋 辰之 on 2019/04/05.
//  Copyright © 2019年 TatsuyukiTakahashi. All rights reserved.
//

import UIKit
import Expression

class ViewController: UIViewController {
    @IBOutlet weak var formulaLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        formulaLabel.text = ""
        answerLabel.text = ""
    }

    @IBAction func inputFormula(_ sender: UIButton) {

        guard let formulaText = formulaLabel.text else {
            return
        }

        guard let senderedText = sender.titleLabel?.text else {
            return
        }

        formulaLabel.text = formulaText + senderedText
    }
    
    @IBAction func clearCal(_ sender: UIButton) {

        formulaLabel.text = ""
        answerLabel.text = ""
    }
    
    @IBAction func answerCal(_ sender: UIButton) {

        guard let formulaText = formulaLabel.text else {
            return
        }

        let formula: String = formatFormula(formulaText)
        answerLabel.text = evalFormula(formula)
    }

    private func formatFormula(_ formula: String) -> String {

        let formattedFormula: String = formula.replacingOccurrences(of: "(?<=^|[÷×\\+\\-\\(])([0-9]+)(?=[÷×\\+\\-\\)]|$)", with: "$1.0", options: NSString.CompareOptions.regularExpression, range: nil).replacingOccurrences(of: "÷", with: "/").replacingOccurrences(of: "×", with: "*")

        return formattedFormula
    }

    private func evalFormula(_ formula: String) -> String {

        do {

            let expression = Expression(formula)
            let answer = try expression.evaluate()

            return formatAnswer(String(answer))
        } catch {

            return "式を正しく入力してください!!"
        }
    }

    private func formatAnswer(_ answer: String) -> String {

        let formattedAnswer: String = answer.replacingOccurrences(of: "\\.0$", with: "", options: NSString.CompareOptions.regularExpression, range: nil)

        return formattedAnswer
    }
}

