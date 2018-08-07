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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     }

    @IBAction func QuestionButtonPressed(_ sender: UIButton) {
        AppDelegate.gm.startGame()
     //AppDelegate.gm.newQuestion()
        self.performSegue(withIdentifier: "startGame", sender: self)
     
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

