import UIKit

// Solution-1
// Time: O(n) where n is the lenght of the array
// Space: O(n)
func isPalindrome(string: String) -> Bool {
    var reversedChars = [Character]()
    var reversedString = ""
    
    for i in (0 ..< string.count).reversed() {
        let endIndex = string.index(string.startIndex, offsetBy: i)
        
        let endChar = string[endIndex]
        reversedChars.append(endChar)
    }
    
    reversedString = String(reversedChars)
    
    return string == reversedString
}

// Solution-2 - Recursive
// Time: O(n) where n is the lenght of the array
// Space: O(n)
func isPalindrome2(string: String, firstIndex: Int = 0) -> Bool {
    let lastIndex = string.count - 1 - firstIndex
    
    // Base case
    if firstIndex >= lastIndex {
        return true
    }
    
    let startIndex = string.index(string.startIndex, offsetBy: firstIndex)
    let endIndex = string.index(string.startIndex, offsetBy: lastIndex)
    
    let firstAndLastEquals = string[startIndex] == string[endIndex]
    let palindromeCheck = isPalindrome2(string: string, firstIndex: firstIndex + 1)
    
    return firstAndLastEquals && palindromeCheck
}

// Solution-3 - Better
// Time: O(n) where n is the length of the string
// Space: O(1)
func isPalindrome3(string: String) -> Bool {
    var leftPointer = 0
    var rightPointer = string.count - 1
    
    var leftIndex = string.index(string.startIndex, offsetBy: leftPointer)
    var rightIndex = string.index(string.startIndex, offsetBy: rightPointer)
    
    while leftPointer < rightPointer {
        if string[leftIndex] != string[rightIndex] {
            return false
        }
        
        leftPointer += 1
        rightPointer -= 1
        leftIndex = string.index(string.startIndex, offsetBy: leftPointer)
        rightIndex = string.index(string.startIndex, offsetBy: rightPointer)
    }
    
    return true
}
