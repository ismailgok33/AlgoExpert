import UIKit

// Solution-1: Finding all the substrings and check if they are palindromes
// Time: O(n^3)
// Space: O(n)
func longestPalindromicSubstring(string: String) -> String {
    guard !string.isEmpty else { return "" }
    
    var longestPalindrome = ""
    
    for i in 0 ..< string.count {
        for j in i ..< string.count {
            let leftIndex = string.index(string.startIndex, offsetBy: i)
            let rightIndex = string.index(string.startIndex, offsetBy: j + 1)
            let substring = String(string[leftIndex ..< rightIndex])
            
            if substring.count > longestPalindrome.count, isPalindrome(substring) {
                longestPalindrome = substring
            }
        }
    }
    
    return longestPalindrome
}

func isPalindrome(_ string: String) -> Bool {
    
    var leftPointer = 0
    var rightPointer = string.count - 1
    
    var leftIndex = string.index(string.startIndex, offsetBy: leftPointer)
    var rightIndex = string.index(string.startIndex, offsetBy: rightPointer)
    
    while leftIndex < rightIndex {
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

// Solution-2: Better - Traversing the string and check if the current character is the center of the palindrome by looking left and right of it.
// Time: O(n^2)
// Space: O(n)
func longestPalindromicSubstring2(string: String) -> String {
    guard !string.isEmpty else { return "" }
    
    var currentLongest = [0, 1] // start and end index of the currentLongest palindrome
    
    for i in 1 ..< string.count {
        // if the palindrome has odd number of characters in it i.e: abcba
        var oddLeftIndex = i - 1
        var oddRightIndex = i + 1
        let odd = getLongestPalindromeFrom(string, &oddLeftIndex, &oddRightIndex)
        
        // if the palindrome has even number of characters in it i.e: abba
        var evenleftIndex = i - 1
        var evenRightIndex = i
        let even = getLongestPalindromeFrom(string, &evenleftIndex, &evenRightIndex)
        
        var temporaryLongest = [Int]()
        
        if let oddFirst = odd.first, let oddLast = odd.last, let evenFirst = even.first, let evenLast = even.last {
            if oddLast - oddFirst > evenLast - evenFirst {
                temporaryLongest = odd
            }
            else {
                temporaryLongest = even
            }
        }
        
        if let temporaryFirst = temporaryLongest.first, let temporaryLast = temporaryLongest.last, let currentFirst = currentLongest.first, let currentLast = currentLongest.last {
            if temporaryLast - temporaryFirst > currentLast - currentFirst {
                currentLongest = temporaryLongest
            }
        }
    }
    
    let firstIndex = string.index(string.startIndex, offsetBy: currentLongest.first!)
    let lastIndex = string.index(string.startIndex, offsetBy: currentLongest.last!)
    
    return String(string[firstIndex ..< lastIndex])
}

func getLongestPalindromeFrom(_ string: String, _ leftIndex: inout Int, _ rightIndex: inout Int) -> [Int] {
    while leftIndex >= 0, rightIndex < string.count {
        let leftStringIndex = string.index(string.startIndex, offsetBy: leftIndex)
        let rightStringIndex = string.index(string.startIndex, offsetBy: rightIndex)
        
        if string[leftStringIndex] != string[rightStringIndex] {
            break
        }
        
        leftIndex -= 1
        rightIndex += 1
        
    }
    return [leftIndex + 1, rightIndex]
}
