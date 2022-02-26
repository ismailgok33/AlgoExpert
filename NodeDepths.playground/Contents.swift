import UIKit

class Program {
    class BinaryTree {
        var value: Int
        var left: BinaryTree?
        var right: BinaryTree?
        
        init(value: Int) {
            self.value = value
        }
    }

    // Solution-1
    // Time: O(n) where n is the number of nodes in the binary tree
    // Space: O(h) where h is the height(depth) of the binary tree
    static func nodeDepths(_ root: BinaryTree?, _ depth: Int = 0) -> Int {
        guard let tree = root else { return 0 }
        
        return depth + nodeDepths(tree.left, depth + 1) + nodeDepths(tree.right, depth + 1)
    }
}
