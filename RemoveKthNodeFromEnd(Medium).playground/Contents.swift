class Program {
    // This is an input class. Do not edit.
    class LinkedList {
        var value: Int?
        var next: LinkedList?
        
        init(value: Int) {
            self.value = value
            next = nil
        }
    }
    
    // Solution-1 - Same time complexity but traverse the linked list a little more than once.
    // Time: O(n) where n is the lenght of the linked list
    // Space: O(1)
    func removeKthNodeFromEnd(head: LinkedList, k: Int) {
        var currentNode: LinkedList? = head
        var count = 0
        
        while currentNode !== nil {
            count += 1
            currentNode = currentNode!.next
        }
        
        let fromHeadCount = count - k
        count = 0
        currentNode = head
        
        if fromHeadCount == 0 { // if the head is to be removed
            head.value = head.next?.value
            head.next = head.next?.next
            
        }
        else {
            while count < fromHeadCount - 1 {
                currentNode = currentNode!.next
                count += 1
            }
            let nodeToBeRemoved = currentNode!.next
            currentNode!.next = nodeToBeRemoved!.next
        }
    }
    
    // Solution-2 - Same time complexity but traverse the linked list exactly once.
    // Time: O(n) where n is the lenght of the linked list
    // Space: O(1)
    func removeKthNodeFromEnd2(head: LinkedList, k: Int) {
        var firstPointer: LinkedList? = head
        var secondPointer: LinkedList? = head
        var counter = 1
        
        while counter <= k {
            secondPointer = secondPointer?.next
            counter += 1
        }
        
        if secondPointer == nil { // if k targets the root node
            head.value = head.next?.value
            head.next = head.next?.next
        }
        else {
            while secondPointer?.next != nil {
                secondPointer = secondPointer?.next
                firstPointer = firstPointer?.next
            }
            
            firstPointer?.next = firstPointer?.next?.next
        }
        
    }
}
