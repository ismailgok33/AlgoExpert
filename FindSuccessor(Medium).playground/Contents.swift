import UIKit

class Program {
    // This is an input class. Do not edit.
    class BinaryTree {
        var value: Int
        var left: BinaryTree?
        var right: BinaryTree?
        var parent: BinaryTree?
        
        init(value: Int) {
            self.value = value
            left = nil
            right = nil
            parent = nil
        }
    }
    
    // Solution-1
    // Time: O(n) where n is the number of the nodes in the tree
    // Space: O(n)
    func findSuccessor(_ tree: BinaryTree, _ node: BinaryTree) -> BinaryTree? {
        var inOrderTraversals = [BinaryTree]()
        getInOrderTraversal(tree, &inOrderTraversals)
        
        for i in 0 ..< inOrderTraversals.count {
            let currentNode = inOrderTraversals[i]
            
            if currentNode !== node {
                continue
            }
            
            if i == inOrderTraversals.count - 1 {
                return nil
            }
            
            return inOrderTraversals[i + 1]
        }
        
        return nil
    }
    
    func getInOrderTraversal(_ bst: BinaryTree?, _ inOrderTraversals: inout [BinaryTree]) {
        
        if bst === nil {
            return
        }
        
        getInOrderTraversal(bst!.left, &inOrderTraversals)
        inOrderTraversals.append(bst!)
        getInOrderTraversal(bst!.right, &inOrderTraversals)
    }
    
    // Solution-2
    // Time: O(h) where h is the lenght of the tree since we don't traverse the whole tree.
    // Space: O(1)
    func findSuccessor2(_ tree: BinaryTree, _ node: BinaryTree) -> BinaryTree? {
       
        if node.right != nil {
            return findLeftMostNode(node.right)
        }
        return findRightMostParent(node)
    }
    
    func findLeftMostNode(_ node: BinaryTree?) -> BinaryTree? {
        var currentNode = node
        
        while currentNode?.left != nil {
            currentNode = currentNode?.left
        }
        
        return currentNode
    }
    
    func findRightMostParent(_ node: BinaryTree?) -> BinaryTree? {
        var currentNode = node
        
        if currentNode?.parent != nil, currentNode?.parent?.right === currentNode {
            currentNode = currentNode?.parent
        }
        
        return currentNode?.parent
    }
    
}
