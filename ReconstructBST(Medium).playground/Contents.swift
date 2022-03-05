import UIKit

class Program {
    // This is an input class. Do not edit.
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
    // Time: O(n^2) where n is the lenght of the array
    // Space: O(n) since the output is a tree that has n number of elements
    func reconstructBst(_ preOrderTraversalValues: [Int]) -> BST? {
        
        guard !preOrderTraversalValues.isEmpty else { return nil }
        
        let currentValue = preOrderTraversalValues[0]
        var indexOfrightTreeRoot = preOrderTraversalValues.count
        let bst = BST(value: currentValue)
        
        for i in 1 ..< preOrderTraversalValues.count {
            if currentValue <= preOrderTraversalValues[i] {
                indexOfrightTreeRoot = i
                break
            }
        }
        
        bst.left = reconstructBst(Array(preOrderTraversalValues[1 ..< indexOfrightTreeRoot]))
        bst.right = reconstructBst(Array(preOrderTraversalValues[indexOfrightTreeRoot...]))
        
        return bst
    }
    
    // Solution-2
    // Time: O(n) where n is the lenght of the array
    // Space: O(n)
    func reconstructBst2(_ preOrderTraversalValues: [Int]) -> BST? {
        
        guard !preOrderTraversalValues.isEmpty else { return nil }
        
        var rootIndex = 0
        return recostructBstFromRange(Int.min, Int.max, preOrderTraversalValues, &rootIndex)
    }
    
    func recostructBstFromRange(_ lowerBound: Int, _ upperBound: Int, _ preOrderTraversalValue: [Int], _ currentRootIndex: inout Int) -> BST? {
        
        if currentRootIndex == preOrderTraversalValue.count {
            return nil
        }
        
        let rootValue = preOrderTraversalValue[currentRootIndex]
        if rootValue < lowerBound || rootValue >= upperBound {
            return nil
        }
        
        currentRootIndex += 1
        let leftSubTree = recostructBstFromRange(lowerBound, rootValue, preOrderTraversalValue, &currentRootIndex)
        let rightSubTree = recostructBstFromRange(rootValue, upperBound, preOrderTraversalValue, &currentRootIndex)
        let bst = BST(value: rootValue)
        bst.left = leftSubTree
        bst.right = rightSubTree
        return bst
    }
    
}
