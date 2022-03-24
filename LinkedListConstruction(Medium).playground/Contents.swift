import Foundation
class Program {
    class Node {
        var value: Int
        var previous: Node?
        var next: Node?
        
        init(value: Int) {
            self.value = value
            previous = nil
            next = nil
        }
    }
    
    class DoublyLinkedList {
        var head: Node?
        var tail: Node?
        
        init() {
            head = nil
            tail = nil
        }
        
        // Time: O(n) where n is the lenght of the linked list
        // Space: O(1)
        func containsNodeWithValue(value: Int) -> Bool {
            guard let headNode = self.head else { return false }
            var currentNode: Node? = headNode
            
            while currentNode != nil {
                if currentNode!.value == value {
                    return true
                }
                currentNode = currentNode!.next
            }
            
            return false
        }
        
        // Time: O(1)
        // Space: O(1)
        func remove(node: Node) {
           
            if node === self.head {
                self.head = self.head?.next
            }
            
            if node === self.tail {
                self.tail = self.tail?.previous
            }
            
            if let prevNode = node.previous {
                prevNode.next = node.next
            }
            
            if let nextNode = node.next {
                nextNode.previous = node.previous
            }
            
            node.previous = nil
            node.next = nil
        }
        
        // Time: O(n) where n is the lenght of the linked list
        // Space: O(1)
        func removeNodesWithValue(value: Int) {
            var currentNode = self.head
            
            while currentNode !== nil {
                let nodeToRemove = currentNode
                currentNode = currentNode?.next
                if nodeToRemove?.value == value {
                    remove(node: nodeToRemove!)
                }
            }
        }
        
        // Time: O(1)
        // Space: O(1)
        func insertBefore(node: Node, nodeToInsert: Node) {
            // if there is only one node in the linked list and nodeToInsert is that one
            if nodeToInsert === self.head, nodeToInsert === self.tail {
                return
            }
            
            remove(node: nodeToInsert)
            nodeToInsert.previous = node.previous
            nodeToInsert.next = node
            
            if node.previous == nil {
                self.head = nodeToInsert
            }
            else {
                node.previous!.next = nodeToInsert
            }
            
            node.previous = nodeToInsert
        }
        
        // Time: O(1)
        // Space: O(1)
        func insertAfter(node: Node, nodeToInsert: Node) {
            // if there is only one node in the linked list and nodeToInsert is that one
            if nodeToInsert === self.head, nodeToInsert === self.tail {
                return
            }
            
            remove(node: nodeToInsert)
            nodeToInsert.previous = node
            nodeToInsert.next = node.next
            
            if node.next == nil {
                self.tail = nodeToInsert
            }
            else {
                node.next!.previous = nodeToInsert
            }
            
            node.next = nodeToInsert
        }
        
        // Time: O(1)
        // Space: O(1)
        func setHead(node: Node) {
            if self.head == nil {
                self.head = node
                self.tail = node
            }
            else {
                insertBefore(node: self.head!, nodeToInsert: node)
            }
            
        }
        
        // Time: O(1)
        // Space: O(1)
        func setTail(node: Node) {
            if self.tail == nil {
                self.head = node
                self.tail = node
            }
            else {
                insertAfter(node: self.tail!, nodeToInsert: node)
            }
        }
        
        // Time: O(1)
        // Space: O(1)
        func insertAtPosition(position: Int, nodeToInsert: Node) {
            if position == 1 {
                setHead(node: nodeToInsert)
                return
            }
            
            var currentNode = self.head
            var currentPosition = 1
            
            while currentNode !== nil, currentPosition != position {
                currentNode = currentNode!.next
                currentPosition += 1
            }
            
            if currentNode === nil { // if the added position is tail position
                setTail(node: nodeToInsert)
            }
            else {
                insertBefore(node: currentNode!, nodeToInsert: nodeToInsert)
            }
        }
    }
}
