import UIKit

class Program {
    // This is an input class. Do not edit.
    class BinaryTree {
        var value: Int
        var left: BinaryTree?
        var right: BinaryTree?
        
        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
    }
    
    // Solution-1: Recursive
    // Time: O(n) where n is the number of nodes in the tree (traverses all nodes)
    // Space: O(logn) (since there can be only depth amount of recursive call in the call stack on average)
    func maxPathSum(tree: BinaryTree?) -> Int {
        let rootMaxSumTuple = findMaxSum(tree: tree)
        return rootMaxSumTuple.1
    }
    
    func findMaxSum(tree: BinaryTree?) -> (Int, Int) {
        // return the tuple. First value is the max sum of a straight branch (without creating a triangle in the tree)
        // second value is the max sum of all.
        if tree === nil {
            return (0, Int.min)
        }
        
        let leftMaxSumTuple = findMaxSum(tree: tree?.left)
        let rightMaxSumTuple = findMaxSum(tree: tree?.right)
        
        let childStraightMaxSum = max(leftMaxSumTuple.0, rightMaxSumTuple.0)
        
        let value = tree!.value
        
        let currentStraightMaxSum = max(childStraightMaxSum + value, value) // childStraightMaxSum could be negative
        let currentTriagleMaxSum = max(leftMaxSumTuple.0 + value + rightMaxSumTuple.0, currentStraightMaxSum) // We can add current value to the max triangle sum
        let currentMaxSum = max(max(leftMaxSumTuple.1, rightMaxSumTuple.1), currentTriagleMaxSum)
        
        return (currentStraightMaxSum, currentMaxSum)
    }
}
