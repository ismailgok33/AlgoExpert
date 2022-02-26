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
    
    // Solution-1
    // Time: O(n) where n is the node count
    // Space: O(1)
    func removeDuplicatesFromLinkedList(_ linkedList: LinkedList) -> LinkedList {
        
        if linkedList.next == nil {
            return linkedList
        }
        
        var currentNode: LinkedList? = linkedList
        
        while currentNode != nil {
            var nextNode = currentNode!.next
            
            while nextNode != nil, nextNode?.value == currentNode?.value {
                nextNode = nextNode?.next
            }
            currentNode?.next = nextNode
            currentNode = nextNode
        }
        
        return linkedList
    }
}
