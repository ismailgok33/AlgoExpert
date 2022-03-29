import UIKit

// Solution-1:
// Time: O(n) where n is the length of the string
// Space: O(n)
func reverseWordsInString(_ string: String) -> String {
    var words = [String]()
    var startOfWordPointer = 0
    let characters = Array(string)
    
    for (index, val) in characters.enumerated() {
        if val == " " { // if the current iteration is on the whitespace
            words.append(String(characters[startOfWordPointer ..< index]))
            startOfWordPointer = index
        }
        else if characters[startOfWordPointer] == " " { // if the current iteration is on a letter and startOfWordPointer is on a whitespace
            // that means this is the last whitespace before a letter
            words.append(" ")
            startOfWordPointer = index
        }
    }
    
    words.append(String(characters[startOfWordPointer...]))
    reverseList(&words)
    return words.joined(separator: "")
}

func reverseList(_ list: inout [String]) {
    var leftPointer = 0
    var rightPointer = list.count - 1
    
    while leftPointer < rightPointer {
        list.swapAt(leftPointer, rightPointer)
        leftPointer += 1
        rightPointer -= 1
    }
}
