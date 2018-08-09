//
//  QuestionManager.swift
//  Trivia
//
//  Created by Samantha Sappenfield on 8/5/18.
//  Copyright © 2018 Samantha Sappenfield. All rights reserved.
//

import Foundation
//ask eksanie for help on ui because you dont know what ur doing
struct Question{
    let category:String
    let question:String
    let correctAnswer:String
    let possibleAnswers:[String]
    let difficulty:String
    let type:String
    
    func newQuestion() -> Question{
       let url = URL(string: "https://opentdb.com/api.php?amount=1&category=9&difficulty=easy&type=multiple")
        var returnValue=Question(category: "", question: "", correctAnswer: "", possibleAnswers:[ " "], difficulty: "", type: "")
        let configuration=URLSessionConfiguration.ephemeral//figure out what this does
        let session=URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        //reps actual connection with server
        let task = session.dataTask(with: url!) { (data, response, error) in
           
            if let data = data {
                do{
                    // Convert the data to JSON
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
                    if let json = jsonSerialized{
                         let results=json["results"] as! NSArray
                         let resultsDict=results[0] as! NSDictionary
                        let tempCat = resultsDict["category"] as! String
                        let tempQ = resultsDict["question"] as! String
                        let tempCA=resultsDict["correct_answer"] as! String
                         var tempPA=resultsDict["incorrect_answers"] as! [String]
                        tempPA.insert(tempCA, at: Int(arc4random_uniform(UInt32(2))))
                         let tempDif=resultsDict["difficulty"] as! String
                         let tempType=resultsDict["type"] as! String
                        returnValue = Question(category: tempCat, question: tempQ, correctAnswer: tempCA, possibleAnswers: tempPA, difficulty: tempDif, type: tempType)
                    print(returnValue)//this should be printing first but its printing after
                        //need to break here to exit the loop maybe?idk//cant return since void function can i make it nonvoid?
                    //ask poonam or somebody about completions/internet says they work but not on xcode anymore
                }
                   
            }  catch let error as NSError {
                print(error.localizedDescription)
                
                }}
         else if let error = error {
            print(error.localizedDescription)
               
        }
    
        }
        task.resume()//is this why its looping back afterward?
        //RunLoop.main.run()
        print(returnValue)//why is this going before the previous print
        print("gotHere")
        return returnValue
        
        
        
    }
    func checkAnswer(answer:String)->Bool{
        if answer == correctAnswer{
            return true
        }
        else {
            return false
        }
    }
}
enum GameStatus{
    case notStarted
    case playing
    case gameOver
}
struct GameState{
    let gameStatus:GameStatus
    let score:Int
    let currentQuestion:Question?
}
class GameMachine{
    var gameState:GameState
    
    init(){
        
        gameState=GameState(gameStatus: .notStarted, score: 0, currentQuestion:nil)
    }
    func startGame(){
        
        
            gameState=GameState(gameStatus: .playing, score: 0, currentQuestion: nil )
        
        
    }
    func newQuestion(){
        let test=Question(category: "", question: "", correctAnswer: "", possibleAnswers:[ " "], difficulty: "", type: "")
        gameState=GameState(gameStatus: .playing, score: gameState.score, currentQuestion: test.newQuestion() )
        
    }
    func answeredQuestion(answer:String){
        guard case gameState.gameStatus = GameStatus.playing else{return}
        if gameState.currentQuestion?.checkAnswer(answer: answer) == true{
            gameState=GameState(gameStatus: .playing, score: gameState.score +
                1, currentQuestion: gameState.currentQuestion?.newQuestion())
            
        }
        else{
            gameState=GameState(gameStatus: .gameOver, score: gameState.score, currentQuestion: nil)
        }
    }
    //maybe set it up so it could be multiplayer
}

