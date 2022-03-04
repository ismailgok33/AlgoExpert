import UIKit

class Program {
    // This is an input class. Do not edit.
    class BST {
        var value: Int?
        var left: BST?
        var right: BST?
        
        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
    }
    
    // Solution-1
    // Time: O(n) where n is the number of elements in the tree
    // Space: O(d) where d is the depth of the tree
    func validateBst(tree: BST) -> Bool {
        
        if tree.right === nil, tree.left === nil {
            return true
        }
        
        var max = Int.max
        var min = Int.min
        
        return validateBstHelper(tree, &min, &max)
    }
    
    func validateBstHelper(_ tree: BST?, _ minimum: inout Int, _ maximum: inout Int) -> Bool {
        
        if tree === nil {
            return true
        }
        
        if let tree = tree, let value = tree.value, value < minimum || value >= maximum {
            return false
        }
        
        if var treeValue = tree?.value {
            let leftIsValid = validateBstHelper(tree?.left, &minimum, &treeValue) // occupies 'd' space at the call stack
            let rightIsValid = validateBstHelper(tree?.right, &treeValue, &maximum) // occupies 'd' space at the call stack after the call stack empties
            
            return leftIsValid && rightIsValid
        }
        else {
            return false
        }
    }
    
}
