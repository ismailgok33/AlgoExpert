    // This is an input class. Do not edit.
    class LinkedList {
        var value: Int
        var next: LinkedList?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    // Solution-1
// Time: O(max(m, n)) where m and n are the lenght of the linkedlists
// Spacer: O(max(m, n))
    func sumOfLinkedLists(_ linkedListOne: LinkedList, _ linkedListTwo: LinkedList) -> LinkedList? {
        
        var counter1 = 1
        var counter2 = 1
        var sum1 = 0
        var sum2 = 0
        var totalSum = 0
        var currentNode1: LinkedList? = linkedListOne
        var currentNode2: LinkedList? = linkedListTwo
        var newLinkedList: LinkedList? = nil
        var newLinkedListHead: LinkedList? = nil
        
        while currentNode1 != nil {
            sum1 += currentNode1!.value * getPowofTen(counter1)
            
            counter1 += 1
            currentNode1 = currentNode1!.next
        }
        
        while currentNode2 != nil {
            sum2 += currentNode2!.value * getPowofTen(counter2)
            
            counter2 += 1
            currentNode2 = currentNode2!.next
        }
        
        totalSum = sum1 + sum2
        let totalSumString = "\(totalSum)"
        
        for char in totalSumString.reversed() {
            print("char: \(char)")
            let node = LinkedList(value: Int(String(char))!)
            
            if newLinkedList == nil {
                newLinkedList = node
                newLinkedListHead = newLinkedList
            }
            else {
                newLinkedList!.next = node
                newLinkedList = newLinkedList!.next
            }
            
        }
        
        return newLinkedListHead
    }
    
    func getPowofTen(_ power: Int) -> Int {
        var result = 1
        for _ in 1 ..< power {
            result *= 10
        }
        
        return result
    }

    
// Solution-2 - Same time and space complexity but a little less linked list traversal.
// Time: O(max(m, n)) where m and n are the lenght of the linkedlists
// Space: O(max(m, n))
func sumOfLinkedLists2(_ linkedListOne: LinkedList, _ linkedListTwo: LinkedList) -> LinkedList? {
    
    let newLinkedListHead = LinkedList(value: 0) // dummy head pointer. Will be removed at the end
    var currentNewNode = newLinkedListHead
    var currentNodeOne: LinkedList? = linkedListOne
    var currentNodeTwo: LinkedList? = linkedListTwo

    var carry = 0
    
    while currentNodeOne != nil || currentNodeTwo != nil || carry != 0 {
        var valueOne = 0
        var valueTwo = 0
        
        if currentNodeOne != nil {
            valueOne = currentNodeOne!.value
        }
        
        if currentNodeTwo != nil {
            valueTwo = currentNodeTwo!.value
        }
        let sumOfValues = valueOne + valueTwo + carry
            
        let newValue = sumOfValues % 10
        let newNode = LinkedList(value: newValue)
        
        currentNewNode.next = newNode
        currentNewNode = newNode
        
        carry = sumOfValues / 10
        
        if currentNodeOne != nil {
            currentNodeOne = currentNodeOne!.next
        }
        
        if currentNodeTwo != nil {
            currentNodeTwo = currentNodeTwo!.next
        }
        
    }
    
    return newLinkedListHead.next!
  }


//let linkedListOne = LinkedList(value: 2)
//linkedListOne.next = LinkedList(value: 4)
//linkedListOne.next?.next = LinkedList(value: 7)
//linkedListOne.next?.next?.next = LinkedList(value: 1)
//
//let linkedListTwo = LinkedList(value: 9)
//linkedListTwo.next = LinkedList(value: 4)
//linkedListTwo.next?.next = LinkedList(value: 5)
//
//sumOfLinkedLists(linkedListOne, linkedListTwo)




