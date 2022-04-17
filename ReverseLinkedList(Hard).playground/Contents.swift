import UIKit

class Program {
    // This is an input class. Do not edit.
    class LinkedList {
        var value: Int
        var next: LinkedList?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    // Solution-1:
    // Time: O(n) where n is the length of the linkedList
    // Space: O(1)
    func reverseLinkedList(_ head: LinkedList) -> LinkedList {
        var previousNode: LinkedList?
        var currentNode: LinkedList? = head
        
        // Important concept: Watch the video explanation here: https://www.algoexpert.io/questions/Reverse%20Linked%20List
        while currentNode != nil {
            var nextPointer = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextPointer
        }
        
        return previousNode!
    }
}

