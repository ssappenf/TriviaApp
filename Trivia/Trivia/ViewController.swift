//
//  ViewController.swift
//  Trivia
//
//  Created by Samantha Sappenfield on 8/5/18.
//  Copyright © 2018 Samantha Sappenfield. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    var gm = GameMachine()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gm.startGame()
     }

    @IBAction func QuestionButtonPressed(_ sender: UIButton) {
   
        gm.newQuestion()
       // print(gm.gameState.currentQuestion)
     
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

