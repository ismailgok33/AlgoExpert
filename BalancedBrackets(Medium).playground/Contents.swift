import UIKit

// Solution-1:
// Time: O(n) where n is the lenght of the string
// Space: O(n)
func balancedBrackets(string: String) -> Bool {
    
    let openingBrackets = "([{"
    let closingBrackets = ")]}"
    
    let matchingBrackets: [Character : Character] = [")" : "(", "]" : "[", "}" : "{"]
    
    var stack = [Character]()
    
    for char in string {
        if openingBrackets.contains(char) {
            stack.append(char)
        }
        else if closingBrackets.contains(char) {
            if stack.isEmpty {
                return false
            }
            else {
                let lastBracket = stack.removeLast()
                if lastBracket != matchingBrackets[char] {
                    return false
                }
            }
        }
    }
    
    return stack.count == 0
}
