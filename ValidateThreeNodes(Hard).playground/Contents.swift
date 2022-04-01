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
    
    // Solution-1: Recursive approach
    // Time: O(h) where h is the height of the tree - Since searching for a node in a BST takes O(h) time
    // Space: O(h) - Since there are h recursion calls in the call stack at the same time
    func validateThreeNodes(_ nodeOne: BST, _ nodeTwo: BST, _ nodeThree: BST) -> Bool {
        
        if isDescendent(nodeTwo, nodeOne) {
            return isDescendent(nodeThree, nodeTwo)
        }
        
        if isDescendent(nodeOne, nodeTwo) {
            return isDescendent(nodeTwo, nodeThree)
        }
        
        return false
    }
    
    func isDescendent(_ node: BST?, _ target: BST) -> Bool {
        if node == nil {
            return false
        }
        
        if node === target {
            return true
        }
        
        if target.value < node!.value {
            return isDescendent(node!.left, target)
        }
        return isDescendent(node!.right, target)
    }
    
    // Solution-2: Iterative approach - Better than Solution-1 since it uses iterative approach. There is no call stack that causes O(h) space
    // Time: O(h) where h is the height of the tree - Since searching for a node in a BST takes O(h) time
    // Space: O(1)
    func validateThreeNodes2(_ nodeOne: BST, _ nodeTwo: BST, _ nodeThree: BST) -> Bool {
        
        if isDescendent2(nodeTwo, nodeOne) {
            return isDescendent(nodeThree, nodeTwo)
        }
        
        if isDescendent2(nodeOne, nodeTwo) {
            return isDescendent(nodeTwo, nodeThree)
        }
        
        return false
    }
    
    func isDescendent2(_ node: BST?, _ target: BST) -> Bool {
        
        var currentNode = node
        
        while currentNode != nil, currentNode !== target {
            if target.value < currentNode!.value {
                currentNode = currentNode!.left
            }
            else {
                currentNode = currentNode!.right
            }
        }
        
        return currentNode === target
    }
    
    // Solution-3: Best - Find the path from nodeOne to nodeThree and check if the nodeTwo is in that path.
    // Time: O(d) where d is the distance between nodeOne to nodeThree (Better if the descendent node isn't a leaf to the tree. (d <= h))
    // Space: O(1)
    func validateThreeNodes3(_ nodeOne: BST, _ nodeTwo: BST, _ nodeThree: BST) -> Bool {
        
        var searchOne: BST? = nodeOne
        var searchTwo: BST? = nodeThree
        
        while true {
            let foundThreeFromOne = searchOne === nodeThree
            let foundOneFromThree = searchTwo === nodeOne
            let foundNodeTwo = searchOne === nodeTwo || searchTwo === nodeTwo
            let finishedSearching = searchOne == nil && searchTwo == nil
            if foundThreeFromOne || foundOneFromThree || foundNodeTwo || finishedSearching {
                break
            }
            
            if searchOne != nil {
                if searchOne!.value < nodeTwo.value {
                    searchOne = searchOne!.right
                }
                else {
                    searchOne = searchOne!.left
                }
            }
            
            if searchTwo != nil {
                if searchTwo!.value < nodeTwo.value {
                    searchTwo = searchTwo!.right
                }
                else {
                    searchTwo = searchTwo!.left
                }
            }
        }
        
        let foundFromOther = searchOne === nodeThree || searchTwo === nodeOne
        let foundNodeTwo = searchOne === nodeTwo || searchTwo === nodeTwo
        if !foundNodeTwo || foundFromOther {
            return false
        }
        
        if searchOne === nodeTwo {
            return searchForTarget(nodeTwo, nodeThree)
        }
        return searchForTarget(nodeTwo, nodeOne)
    }
    
    func searchForTarget(_ node: BST?, _ target: BST) -> Bool {
        
        var currentNode = node
        
        while currentNode != nil, currentNode !== target {
            if target.value < currentNode!.value {
                currentNode = currentNode!.left
            }
            else {
                currentNode = currentNode!.right
            }
        }
        
        return currentNode === target
    }
}
