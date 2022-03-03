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

        // Solution-1 (insert)
        // Time: Avg: O(logn) - Worst: O(n)
        // Space: Avg: O(logn) - Worst: O(n)
        func insert(value: Int) -> BST {
            
            if value >= self.value {
                if let right = right {
                    return right.insert(value: value)
                }
                else {
                    right = BST(value: value)
                }
                
            }
            else {
                if let left = left {
                    return left.insert(value: value)
                }
                else {
                    left = BST(value: value)
                }
            }
            
            return self
        }
        
        // Solution-1 (contains)
        // Time: Avg: O(logn) - Worst: O(n)
        // Space: Avg: O(logn) - Worst: O(n)
        func contains(value: Int) -> Bool {
            
            if value > self.value {
                if let right = right {
                    return right.contains(value: value)
                }
                else {
                    return false
                }
                
            }
            else if value < self.value {
                if let left = left {
                    return left.contains(value: value)
                }
                else {
                    return false
                }
            }
            else {
                return true
            }
        }
        
        // Solution-1 (remove)
        // Time: Avg: O(logn) - Worst: O(n)
        // Space: Avg: O(logn) - Worst: O(n)
        func remove(value: Int?, parentNode: BST?) -> BST {
            
            if let valueToBeRemoved = value {
                if valueToBeRemoved < self.value {
                    self.left?.remove(value: valueToBeRemoved, parentNode: self)
                }
                else if valueToBeRemoved > self.value {
                    self.right?.remove(value: valueToBeRemoved, parentNode: self)
                }
                else { // found the value. Remove it
                    
                    // if the node is an edge node
                    if self.left === nil, self.right === nil {
                        if let parentNode = parentNode {
                            if self.value < parentNode.value {
                                parentNode.left = nil
                            }
                            else {
                                parentNode.right = nil
                            }
                        }
                        else {
                            // single node tree, do nothing
                        }
                    }
                    
                    // if the node has only one child
                    if let right = self.right, self.left === nil {
                        if let parentNode = parentNode {
                            if self.value < parentNode.value {
                                parentNode.left = right
                            }
                            else {
                                parentNode.right = right
                            }
                        }
                        else { // the node is the root node has only right child
                            self.value = right.value
                            self.left = right.left
                            self.right = right.right
                        }
                    }
                    else if self.right === nil, let left = self.left {
                        if let parentNode = parentNode {
                            if self.value < parentNode.value {
                                parentNode.left = left
                            }
                            else {
                                parentNode.right = left
                            }
                        }
                        else { // the node is the root node has only left child
                            self.value = left.value
                            self.left = left.left
                            self.right = left.right
                        }
                    }
                
                    // else - search the right tree and find the smallest value (left-most value) and replace it
                    else {
                        if let right = self.right {
                            self.value = right.getMinValue()
                            right.remove(value: self.value, parentNode: self)
                        }
                    }
                }
            }
            
            return self
        }
        
        func getMinValue() -> Int {
            if let left = self.left {
                return left.getMinValue()
            }
            else {
                return self.value
            }
        }
        
        // -------------- Iterative ---------------
        
        // Solution-2 (insert)
        // Time: Avg: O(logn) - Worst: O(n)
        // Space: O(1)
        func insert2(value: Int) -> BST {
            var currentNode: BST? = self
            
            while true {
                if let node = currentNode {
                    if value < node.value {
                        if node.left === nil {
                            let newNode = BST(value: value)
                            node.left = newNode
                            break
                        }
                        else {
                            currentNode = node.left
                        }
                    }
                    else {
                        if node.right === nil {
                            let newNode = BST(value: value)
                            node.right = newNode
                            break
                        }
                        else {
                            currentNode = node.right
                        }
                    }
                }
                else {
                    break
                }
            }
            
            return self
        }
        
        // Solution-2 (contains)
        // Time: Avg: O(logn) - Worst: O(n)
        // Space: O(1)
        func contains2(value: Int) -> Bool {
            var currentNode: BST? = self
            
            while currentNode !== nil {
                if let node = currentNode {
                    if value < node.value {
                        currentNode = node.left
                    }
                    else if value > node.value {
                        currentNode = node.right
                    }
                    else {
                        return true
                    }
                }
            }
            
            return false
        }
        
        // Solution-2 (remove)
        // Time: Avg: O(logn) - Worst: O(n)
        // Space: O(1)
        func remove2(value: Int, parentNode: BST?) -> BST {
            var currentNode: BST? = self
            var parentNode: BST? = parentNode
            
            while let node = currentNode {
                if value < node.value {
                    parentNode = node
                    currentNode = node.left
                }
                else if value > node.value {
                    parentNode = node
                    currentNode = node.right
                }
                else { // found the value. Remove it.
                    
                    // if the node is an edge node
                    if node.left === nil, node.right === nil {
                        if let parentNode = parentNode {
                            currentNode = nil // exit condition
                            if node.value < parentNode.value {
                                parentNode.left = nil
                            }
                            else {
                                parentNode.right = nil
                            }
                        }
                        else {
                            // One node tree, do nothing
                        }
                    }
                    
                    // if the node has only one child and it is left child
                    else if let leftNode = node.left, node.right === nil {
                        if let parentNode = parentNode {
                            currentNode = nil // exit condition
                            if leftNode.value < parentNode.value {
                                parentNode.left = leftNode
                            }
                            else {
                                parentNode.right = leftNode
                            }
                        }
                        else {
                            // this is the root node and has only left child
                            node.value = leftNode.value
                            node.left = leftNode.left
                            node.right = leftNode.right
                        }
                    }
                    // if the node has only one child and it is right child
                    else if let rightNode = node.right, node.left === nil {
                        if let parentNode = parentNode {
                            currentNode = nil // exit condition
                            if rightNode.value < parentNode.value {
                                parentNode.left = rightNode
                            }
                            else {
                                parentNode.right = rightNode
                            }
                        }
                        else {
                            // this is the root node and has only right child
                            node.value = rightNode.value
                            node.left = rightNode.left
                            node.right = rightNode.right
                        }
                    }
                
                    // else - search the right tree and find the smallest value (left-most value) and replace it
                    else {
                        if let rightNode = node.right {
                            node.value = rightNode.getMinValue2()
                            rightNode.remove2(value: node.value, parentNode: node)
                        }
                    }
                    break
                }
            }
            
            
            return self
        }
        
        func getMinValue2() -> Int {
            var currentNode = self
            
            while currentNode.left !== nil {
                if let leftNode = currentNode.left {
                    currentNode = leftNode
                }
            }
            
            return currentNode.value
        }
        
        
    }
}
