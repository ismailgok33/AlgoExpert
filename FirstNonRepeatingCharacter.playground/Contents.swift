import UIKit

// Solution-1
// Time: O(n^2) where n is the length of the string
// Space: O(n)
func firstNonRepeatingCharacter(_ string: String) -> Int {
    
    guard !string.isEmpty else { return -1 }
    
    var repeatition = 0
    var chars: [Character] = Array(string)
    
    for i in 0 ..< string.count {
        for j in 0 ..< string.count {
            if i == j {
                continue
            }
            if chars[i] == chars[j] {
                repeatition += 1
            }
        }
        
        if repeatition == 0 {
            return i
        }
        else {
            repeatition = 0
        }
    }
    
    return -1
}

var string = "abbcdcaf"
print(firstNonRepeatingCharacter(string))

// Solution-2 - Slightly better
// Time: O(n^2) where n is the length of the string
// Space: O(1)
func firstNonRepeatingCharacter2(_ string: String) -> Int {
    
    guard !string.isEmpty else { return -1 }
    
    var duplicate = false
    
    for (i, char) in string.enumerated() {
        duplicate = false
        
        for (j, char2) in string.enumerated() {
            if char == char2, i != j {
                duplicate = true
            }
        }
        
        if !duplicate {
            return i
        }
    }
    
    return -1
}

print(firstNonRepeatingCharacter2(string))


// Solution-3 - Best
// Time: O(n) where n is the length of the string
// Space: O(1) since there are a finite number (26) of letters in the English alphabet so the size of the dictionary is a constant
func firstNonRepeatingCharacter3(_ string: String) -> Int {
    
    
}

print(firstNonRepeatingCharacter3(string))
