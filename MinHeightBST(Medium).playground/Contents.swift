import UIKit

class Program {
    
    // Solution-1
    // Time: O(nlogn) where n is the length of the array. O(n) is for traversing every element on the array and pregiven insert func runs on O(logn) => O(nlogn)
    // Space: O(n)
    static func minHeightBST(_ array: [Int]) -> BST? {
        return bstConstructor(array: array, bst: nil, startIndex: 0, endIndex: array.count - 1)
    }
    
    static func bstConstructor(array: [Int], bst: BST?, startIndex: Int, endIndex: Int) -> BST? {
        if startIndex > endIndex {
            return nil
        }
        
        let midIndex = (startIndex + endIndex) / 2
        let valueToAdd = array[midIndex]
        var newBst = bst
        if let newBst = newBst {
            newBst.insert(value: valueToAdd)
        }
        else {
            newBst = BST(value: valueToAdd)
        }
        
        bstConstructor(array: array, bst: newBst, startIndex: startIndex, endIndex: midIndex - 1) // recursion for the left subarray
        bstConstructor(array: array, bst: newBst, startIndex: midIndex + 1, endIndex: endIndex) // recursion for the right subarray
        
        return newBst
    }
    
    // Solution-2
    // Time: O(n) where n is the length of the array. (Since we don't you pregiven insert function)
    // Space: O(n)
    static func minHeightBST2(_ array: [Int]) -> BST? {
        return bstConstructor2(array: array, bst: nil, startIndex: 0, endIndex: array.count - 1)
    }
    
    static func bstConstructor2(array: [Int], bst: BST?, startIndex: Int, endIndex: Int) -> BST? {
        if startIndex > endIndex {
            return nil
        }
        
        let midIndex = (startIndex + endIndex) / 2
        let valueToAdd = array[midIndex]
        
        var mutableBst = bst
        let nodeToAdd = BST(value: valueToAdd)
        
        if let mutableBst = mutableBst {
            if valueToAdd < mutableBst.value { // add the new node to its left and point to the new node as newBst
                mutableBst.left = nodeToAdd
            }
            else { // add the new node to its right and point to the new node as newBst
                mutableBst.right = nodeToAdd
            }
        }
        
        mutableBst = nodeToAdd
        
        bstConstructor2(array: array, bst: mutableBst, startIndex: startIndex, endIndex: midIndex - 1) // recursion for the left subarray
        bstConstructor2(array: array, bst: mutableBst, startIndex: midIndex + 1, endIndex: endIndex) // recursion for the right subarray
        
        return mutableBst
    }
    
    // Solution-3
    // Time: O(n) where n is the length of the array. (Since we don't you pregiven insert function) - Shorter
    // Space: O(n)
    static func minHeightBST3(_ array: [Int]) -> BST? {
        return bstConstructor3(array: array, startIndex: 0, endIndex: array.count - 1)
    }
    
    static func bstConstructor3(array: [Int], startIndex: Int, endIndex: Int) -> BST? {
        if startIndex > endIndex {
            return nil
        }
        
        let midIndex = (startIndex + endIndex) / 2
        let valueToAdd = array[midIndex]

        let bst = BST(value: valueToAdd)
        
        bst.left = bstConstructor3(array: array, startIndex: startIndex, endIndex: midIndex - 1) // recursion for the left subarray
        bst.right = bstConstructor3(array: array, startIndex: midIndex + 1, endIndex: endIndex) // recursion for the right subarray
        
        return bst
    }
    
    class BST {
        var value: Int
        var left: BST?
        var right: BST?
        
        init(value: Int) {
            self.value = value
        }
        
        func insert(value: Int) {
            if value < self.value {
                if let left = self.left {
                    left.insert(value: value)
                } else {
                    left = BST(value: value)
                }
            } else {
                if let right = self.right {
                    right.insert(value: value)
                } else {
                    right = BST(value: value)
                }
            }
        }
    }
}
