//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Samantha Sappenfield on 8/6/18.
//  Copyright © 2018 Samantha Sappenfield. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var ButtonA: UIButton!
    @IBOutlet weak var ButtonB: UIButton!
    @IBOutlet weak var ButtonC: UIButton!
    @IBOutlet weak var ButtonD: UIButton!
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        print(sender)
    }
    override func viewWillAppear(_ animated: Bool) {
        updateQuestionAndAnswers()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func updateQuestionAndAnswers(){
        AppDelegate.gm.newQuestion()
        QuestionLabel.text=AppDelegate.gm.gameState.currentQuestion?.question
    }

}
