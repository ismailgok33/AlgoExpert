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
    // Time: O(n) where n is the number of nodes in the bst
    // Space O(n) since we are adding every value of the bst to a new array
    func findKthLargestValueInBst(_ tree: BST, _ k: Int) -> Int {
        var sortedValues = [Int]()
        
        inOrderTraversal(tree, sortedValues: &sortedValues)
        
        return sortedValues[sortedValues.count - k]
    }
    func inOrderTraversal(_ node: BST?, sortedValues: inout [Int]) {
        if node === nil {
            return
        }
        
        inOrderTraversal(node!.left, sortedValues: &sortedValues)
        sortedValues.append(node!.value)
        inOrderTraversal(node!.right, sortedValues: &sortedValues)
    }
    
    // Solution-2
    // Time: O(h + k) where h is the height of the tree since we are traversing the right of tree to the deepest node and k is the given number
    // Space O(h) since at most the call stack has h function
    struct TreeInfo {
        var numberOfNodesVisited: Int
        var valueOfLatestVisitedNode: Int
    }
    func findKthLargestValueInBst2(_ tree: BST, _ k: Int) -> Int {
        var treeInfo = TreeInfo(numberOfNodesVisited: 0, valueOfLatestVisitedNode: -1)
        
        reverseInOrderTraversal(tree, k, treeInfo: &treeInfo)
        
        return treeInfo.valueOfLatestVisitedNode
    }
    func reverseInOrderTraversal(_ node: BST?, _ k: Int, treeInfo: inout TreeInfo) {
        if node === nil || treeInfo.numberOfNodesVisited >= k {
            return
        }
        reverseInOrderTraversal(node!.right, k, treeInfo: &treeInfo) // traverse the right of the bst first
        
        if treeInfo.numberOfNodesVisited < k {
            treeInfo.numberOfNodesVisited += 1
            treeInfo.valueOfLatestVisitedNode = node!.value
        }
        
        reverseInOrderTraversal(node!.left, k, treeInfo: &treeInfo) // traverse the left of the bst later
    }
}
