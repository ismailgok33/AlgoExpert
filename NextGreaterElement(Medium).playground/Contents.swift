import UIKit

// Solution-1: Stack
// Time: O(n) where n is the lenght of the array
// Space: O(n)
func nextGreaterElement(_ array: [Int]) -> [Int] {
    
    var result = [Int](repeating: -1, count: array.count)
    var stack = [Int]()
    
    for i in 0 ..< array.count * 2 {
        let circularIndex = i % array.count
        
        while stack.count > 0, array[stack.last!] < array[circularIndex] {
            let indexToBeChanged = stack.removeLast()
            result[indexToBeChanged] = array[circularIndex]
        }
        
        stack.append(circularIndex)
        
    }
    
    return result
}

// Solution-2: Stack
// Time: O(n) where n is the lenght of the array
// Space: O(n)
func nextGreaterElement2(_ array: [Int]) -> [Int] {
    
    var result = [Int](repeating: -1, count: array.count)
    var stack = [Int]()
    
    for i in stride(from: 2 * array.count - 1, through: 0, by: -1) {
        let circularIndex = i % array.count
        
        while stack.count > 0 {
            if stack.last! <= array[circularIndex] {
                stack.popLast()
            }
            else {
                result[circularIndex] = stack.last!
                break
            }
        }
        
        stack.append(array[circularIndex])
    }
    
    return result
}
