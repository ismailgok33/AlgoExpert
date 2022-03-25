import UIKit

// Solution-1
// Time: O(4^n * n) where n is the lenght of the phoneNumber.
// The max number of recursions in the call stack is 4^n since at most there are 4 letters in a digit keypad (consider the recursion tree)
// and in every recursive call hits the base case which joins a string array into a string which is an O(n) time operation
// Space: O(4^n * n) since the output is an array of lenght 4^n and every element of the array is a n length string
func phoneNumberMnemonics(_ phoneNumber: String) -> [String] {
    var currentMnemonics = [String](repeating: "0", count: phoneNumber.count)
    var mnemonicsFound = [String]()
    
    phoneNumberMnemonicsHelper(index: 0, phoneNumber: phoneNumber, currentMnemonics: &currentMnemonics, mnemonicsFound: &mnemonicsFound)
    
    return mnemonicsFound
}

func phoneNumberMnemonicsHelper(index: Int, phoneNumber: String, currentMnemonics: inout [String], mnemonicsFound: inout [String]) {
    if index == phoneNumber.count { // base case
        let mnemonics = currentMnemonics.joined() // O(n) time
        mnemonicsFound.append(mnemonics)
    }
    else {
        let digit = String(phoneNumber[phoneNumber.index(phoneNumber.startIndex, offsetBy: index)])
        let letters = DIGIT_LETTERS[digit]!
        
        for letter in letters {
            currentMnemonics[index] = letter
            phoneNumberMnemonicsHelper(index: index + 1, phoneNumber: phoneNumber, currentMnemonics: &currentMnemonics, mnemonicsFound: &mnemonicsFound)
        }
        
    }
}

let DIGIT_LETTERS: [String: [String]] = [
    "0": ["0"],
    "1": ["1"],
    "2": ["a", "b", "c"],
    "3": ["d", "e", "f"],
    "4": ["g", "h", "i"],
    "5": ["j", "k", "l"],
    "6": ["m", "n", "o"],
    "7": ["p", "q", "r", "s"],
    "8": ["t", "u", "v"],
    "9": ["w", "x", "y", "z"],
]
