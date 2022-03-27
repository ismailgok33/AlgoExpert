import UIKit

// Solution-1: Stack + Recursion
// Time: O(n^2) where n is the lenght of the stack array
// Space: O(n)
func sortStack(_ stack: inout [Int]) -> [Int] {
    
    guard !stack.isEmpty else { return stack }
    
    let top = stack.removeLast()
    sortStack(&stack)
    
    insertInSortedStack(&stack, top)
    return stack
}

func insertInSortedStack(_ stack: inout [Int], _ value: Int) {
    if stack.count == 0 || stack.last! <= value {
        stack.append(value)
        return
    }
    
    let top = stack.removeLast()
    insertInSortedStack(&stack, value)
    stack.append(top)
}
