import UIKit



class Program {
    class BST {
        var value: Int
        var left: BST?
        var right: BST?

        init(value: Int) {
          self.value = value
          left = nil
          right = nil
        }
    }
    
    // Solution-1
    // Time: Average: O(logn) - Worst: O(n) where n is the number of nodes in the tree
    // Space: Average: O(logn) - Worst: O(n)

    func findClosestValueInBST(tree: BST?, target: Int) -> Int {

        guard let tree = tree else { return -1 }
        
        var closestValue = tree.value
        return recurrentClosestFinder(tree, target, &closestValue)
      
    }
    
    func recurrentClosestFinder(_ tree: BST, _ target: Int, _ closestValue: inout Int) -> Int {
        
        let closestDifference = abs(target - closestValue)
        let currentDifference = abs(target - tree.value)
        
        if currentDifference < closestDifference {
            closestValue = tree.value
        }
        
        if target < tree.value {
            guard let leftTree = tree.left else { return closestValue }
            return recurrentClosestFinder(leftTree, target, &closestValue)
        }
        else {
            guard let rightTree = tree.right else { return closestValue }
            return recurrentClosestFinder(rightTree, target, &closestValue)
        }
        
    }
    
    // Solution-2
    // Time: Average O(logn) - Worst O(n)
    // Space: Average O(1) - Worst O(1)
    func findClosestValueInBST2(tree: BST?, target: Int) -> Int {

        guard let tree = tree else { return -1 }
        
        var closestValue = tree.value
        return recurrentClosestFinder2(tree, target, &closestValue)
      
    }
    
    func recurrentClosestFinder2(_ tree: BST, _ target: Int, _ closestValue: inout Int) -> Int {
        
        var currentNode = tree
        
        while currentNode !== nil {
            
            let closestDifference = abs(target - closestValue)
            let currentDifference = abs(target - tree.value)
            
            if currentDifference < closestDifference {
                closestValue = tree.value
            }
            
            if target < currentNode.value {
                guard let leftTree = currentNode.left else { return closestValue }
                currentNode = leftTree
            }
            else {
                guard let rightTree = currentNode.right else { return closestValue }
                currentNode = rightTree
            }
        }
        
        return closestValue
    }
}
