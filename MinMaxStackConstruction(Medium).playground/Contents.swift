import UIKit

// Solution-1:
class Program {
    // Feel free to add new properties and methods to the class.
    class MinMaxStack {
        
        // var minMaxStack = [[String: Int]]() -> min: x max: y we could also store min and max lists like that.
        var minStack = [Int]()
        var maxStack = [Int]()
        var stack = [Int]()
        
        // Time: O(1)
        // Space: O(1)
        func peek() -> Int? {
            return stack.last
        }
        
        // Time: O(1)
        // Space: O(1)
        func pop() -> Int? {
            minStack.popLast()
            maxStack.popLast()
            return stack.popLast()
            
        }
        
        // Time: O(1)
        // Space: O(1)
        func push(number: Int) {
            let lastMinValue = minStack.last
            if lastMinValue == nil || lastMinValue! > number {
                minStack.append(number)
            }
            else {
                minStack.append(lastMinValue!)
            }
            
            let lastMaxValue = maxStack.last
            if lastMaxValue == nil || lastMaxValue! < number {
                maxStack.append(number)
            }
            else {
                maxStack.append(lastMaxValue!)
            }
            
            stack.append(number)
        }
        
        // Time: O(1)
        // Space: O(1)
        func getMin() -> Int? {
            return minStack.last
        }
        
        // Time: O(1)
        // Space: O(1)
        func getMax() -> Int? {
            return maxStack.last
        }
    }
}
