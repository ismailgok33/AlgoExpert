import UIKit

class BinaryTree: Equatable {
    static func == (lhs: BinaryTree, rhs: BinaryTree) -> Bool {
        if lhs.left == rhs.right, lhs.left == rhs.left, lhs.value == rhs.value {
            return true
        }
        else {
            return false
        }
    }
    
    var value: Int?
    var left: BinaryTree?
    var right: BinaryTree?
}

class Program {
    // Solution-1
    // Time: O(n) where n is the number of the nodes in the tree
    // Space: O(h) where h is the height of the tree
    func invertBinaryTree(tree: BinaryTree?) {
        if let bst = tree {
            let temp = bst.left
            bst.left = bst.right
            bst.right = temp
            
            invertBinaryTree(tree: bst.left)
            invertBinaryTree(tree: bst.right)
        }
        else {
            return
        }
    }
    
    // Solution-2
    // Time: O(n) where n is the number of the nodes in the tree
    // Space: O(n) since we are adding all of the nodes to the queue
    func invertBinaryTree2(tree: BinaryTree?) {
        var queue: [BinaryTree?] = [tree]
        
        while queue.count > 0 {
            let currentNode = queue.removeFirst()
            
            if currentNode === nil {
                continue
            }
            
            let temp = currentNode!.left
            currentNode!.left = currentNode!.right
            currentNode!.right = temp
            
            queue.append(currentNode!.left)
            queue.append(currentNode!.right)
        }
    }
}
