import UIKit


// Solution-1
// Time: O(n) where n is the lenght of the string
// Space: O(n)
func caesarCipherEncryptor(string: String, key: UInt32) -> String {
    
    let newKey = key % 26
    var newLetters = [Character]()
    
    for letter in string {
        newLetters.append(getNewLetter(letter, newKey))
    }
    
    return String(newLetters)
}

func getNewLetter(_ letter: Character, _ key: UInt32) -> Character {
    let newLetterCode = letter.unicodeScalars.first!.value + key
    
    let code: UnicodeScalar?
    
    if newLetterCode <= 122 {
        code = UnicodeScalar(newLetterCode)
    }
    else {
        code = UnicodeScalar(96 + newLetterCode % 122)
    }
    
    return Character(code!)
}

// Solution-2
// Time: O(n) where n is the lenght of the string
// Space: O(n)
func caesarCipherEncryptor2(string: String, key: UInt32) -> String {
    
    let newKey = key % 26
    var newLetters = [Character]()
    
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
    for letter in string {
        newLetters.append(getNewLetter2(letter, newKey, alphabet))
    }
    
    return String(newLetters)
}

func getNewLetter2(_ letter: Character, _ key: UInt32, _ alphabet: [Character]) -> Character {
    let newLetterCode = alphabet.firstIndex(of: letter)! + Int(key)
    return alphabet[newLetterCode % 26]
}
