import UIKit


// Solution-1
// Time: O(n + m) where n is the length of the characters and m is the length of the document
// Space: O(c + d) where c is the unique characters in characters string and d is the unique characters in document string
func generateDocument(_ characters: String, _ document: String) -> Bool {
    
    guard !document.isEmpty else { return true }
    guard !characters.isEmpty else { return false }
    
    var characterDict = [Character: Int]()
    var documentDict = [Character: Int]()
    
    for elm in characters {
        let freq = characterDict[elm, default: 0] + 1
        characterDict[elm] = freq
    }
    
    for elm in document {
        let freq = documentDict[elm, default: 0] + 1
        documentDict[elm] = freq
    }
    
    for (key, value) in documentDict {
        if value > characterDict[key, default: 0] {
            return false
        }
    }
    
    return true
}

// Solution-2 - Slightly better (with only one dictionary instead of two)
// Time: O(n + m) where n is the length of the characters and m is the length of the document
// Space: O(c) where c is the unique characters in characters string
func generateDocument2(_ characters: String, _ document: String) -> Bool {
    
    guard !document.isEmpty else { return true }
    guard !characters.isEmpty else { return false }
    
    var characterDict = [Character: Int]()
    
    for elm in characters {
        let freq = characterDict[elm, default: 0] + 1
        characterDict[elm] = freq
    }
    
    for elm in document {
        let freq = characterDict[elm, default: 0] - 1
        characterDict[elm] = freq
    }
    
    for value in characterDict.values {
        if value < 0 {
            return false
        }
    }
    
    return true
}

// Solution-3 - Worst
// Time: O(m * (m + n)) where m is the lenght of the document string and n is the lenght of the characters string
// Space: O(1)
func generateDocument3(_ characters: String, _ document: String) -> Bool {
    
    guard !document.isEmpty else { return true }
    guard !characters.isEmpty else { return false }
    
    for elm in document {
        let characterFreq = findFrequency(elm, characters)
        let documentFreq = findFrequency(elm, document)
        
        if characterFreq < documentFreq {
            return false
        }
    }
    
    return true
}

func findFrequency(_ character: Character, _ target: String) -> Int {
    var freq = 0
    for elm in target {
        if elm == character {
            freq += 1
        }
    }
    
    return freq
}
