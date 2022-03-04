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
    
    func inOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        
        if tree !== nil {
            // first traverse left tree
            inOrderTraversal(tree: tree?.left, array: &array)
            
            // add node to array
            if let value = tree?.value {
                array.append(value)
            }
            
            // after traverse right tree
            inOrderTraversal(tree: tree?.right, array: &array)
        }
        
        
        return array
    }
    
    
    func preOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        if tree !== nil {
            // add root node to array
            if let value = tree?.value {
                array.append(value)
            }
            
            // first traverse left tree
            preOrderTraversal(tree: tree?.left, array: &array)
            
            // after traverse right tree
            preOrderTraversal(tree: tree?.right, array: &array)
        }
        
        return array
    }
    
    func postOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        if tree !== nil {
            // first traverse left tree
            postOrderTraversal(tree: tree?.left, array: &array)
            
            // after traverse right tree
            postOrderTraversal(tree: tree?.right, array: &array)
            
            // add root node to array
            if let value = tree?.value {
                array.append(value)
            }
        }
        
        return array
    }
}
