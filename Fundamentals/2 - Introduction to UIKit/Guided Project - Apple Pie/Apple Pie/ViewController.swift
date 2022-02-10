//
//  ViewController.swift
//  Apple Pie
//
//  Created by Роман Солдатов on 26.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var scoringLabel: UILabel!
    @IBOutlet var playerLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var guessFullWordTextField: UITextField!
    var listOfWords = ["buccaneer", "swift", "glorious",
    "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var playerNumber = 0
    let maxPlayers = 3
    var scoring: [Int] = []
    var currentGame: Game!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoring = Array(repeating: 0, count: maxPlayers)
        newRound()
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        if currentGame.playerGuessed(letter: letter) {
            scoring[playerNumber] += 5
        } else {
            playerNumber += 1
            playerNumber %= maxPlayers
        }
        updateGameState()
    }
    
    @IBAction func guessWordAction(_ sender: UITextField) {
        sender.resignFirstResponder()
        if let fullWord = sender.text {
            if currentGame.playerGuessedFullWord(fullWord: fullWord.lowercased().replacingOccurrences(of: " ", with: "")) {
                scoring[playerNumber] += (currentGame.formattedWord.components(separatedBy: "_").count - 1)*5
            } else {
                playerNumber += 1
                playerNumber %= maxPlayers
            }
            updateGameState()
        }
    }
    
    func newRound() {
        guessFullWordTextField.text = ""
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
        } else {
            enableLetterButtons(false)
        }
        updateUI()
    }
    
    func updateUI() {
        let letters = currentGame.formattedWord.map {  String($0) }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        var playerScores = ""
        for (i, score) in scoring.enumerated() {
            playerScores.append("Player \(i+1): \(score) ")
        }
        scoringLabel.text = "Scores: \(playerScores)"
        playerLabel.text = "Player: \(playerNumber+1)"
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.wordGuessed || currentGame.word == currentGame.formattedWord {
            scoring[playerNumber] += 10
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
        guessFullWordTextField.isEnabled = enable
    }
}
