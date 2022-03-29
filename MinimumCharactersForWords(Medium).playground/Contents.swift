import UIKit

// Solution-1:
// Time: O(n x l) where n is the lenght of the words array and l is the longest string in the words array. Since we are looping through ever char in that string array
// Space: O(c) where c is the number of unique characters in words string array
func minimumCharactersForWords(_ words: [String]) -> [String] {
    
    var maximumCharacterFrequencies = [Character : Int]()
    var result = [String]()
    
    for word in words {
        let characterFrequencies = countCharacterFrequencies(word)
        updateMaximumCharacterFrequencies(characterFrequencies, &maximumCharacterFrequencies)
    }
    
    for (char, freq) in maximumCharacterFrequencies {
        for _ in 0 ..< freq {
            result.append(String(char))
        }
    }
    
    return result
}

func countCharacterFrequencies(_ string: String) -> [Character : Int] {
    var characterFrequencies = [Character : Int]()
    
    for char in string {
        characterFrequencies[char, default: 0] += 1
    }
    
    return characterFrequencies
}

func updateMaximumCharacterFrequencies(_ characterFrequencies: [Character : Int], _ maximumCharacterFrequencies: inout [Character : Int]) {
    
    for (char, freq) in characterFrequencies {
        maximumCharacterFrequencies[char] = max(freq, maximumCharacterFrequencies[char, default: 0])
    }
    
}
