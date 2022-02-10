//
//  Game.swift
//  Apple Pie
//
//  Created by Роман Солдатов on 26.01.2022.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            guessedWord += guessedLetters.contains(letter) ? "\(letter)" : "_"

        }
        
        return guessedWord
    }
    var wordGuessed = false
    let specialCharacters: [Character: String] = ["e": "eèéêëēėę", "y": "yÿ", "u": "uûüùúū", "i": "iîïíīįì", "o": "oôöòóœøōõ", "a": "aàáâäæãåā", "s": "sßśš", "l": "lł", "z": "zžźż", "c": "cçćč", "n": "nñń"]
    
    mutating func playerGuessed(letter: Character) -> Bool {
        if let possibleCharacters = specialCharacters[letter] {
            guessedLetters += possibleCharacters
            for symbol in possibleCharacters {
                if word.contains(symbol) {
                    return true
                }
            }
            incorrectMovesRemaining -= 1
            return false
        } else {
            guessedLetters.append(letter)
            if !word.contains(letter) {
                incorrectMovesRemaining -= 1
                return false
            } else {
                return true
            }
        }
    }
    
    mutating func playerGuessedFullWord(fullWord: String) -> Bool {
        if word == fullWord {
            wordGuessed = true
            return true
        } else {
            incorrectMovesRemaining -= 1
            return false
        }
    }
}
