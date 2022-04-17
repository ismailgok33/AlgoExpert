import UIKit

class Program {
    // This is an input class. Do not edit.
    class LinkedList {
        var value: Int
        var next: LinkedList?
        
        init(value: Int) {
            self.value = value
            next = nil
        }
    }
    
    // Solution-1:
    // Time: O(n) where n is the lenght of the linkedList
    // Space: O(1)
    func findLoop(head: LinkedList) -> LinkedList? {
        var firstPointer = head.next
        var secondPointer = head.next?.next
        
        // Important solution. Watch the solution here: https://www.algoexpert.io/questions/Find%20Loop
        while firstPointer !== secondPointer {
            firstPointer = firstPointer?.next
            secondPointer = secondPointer?.next?.next
        }
        
        firstPointer = head
        
        while firstPointer !== secondPointer {
            firstPointer = firstPointer?.next
            secondPointer = secondPointer?.next
        }
        
        return firstPointer
    }
}
