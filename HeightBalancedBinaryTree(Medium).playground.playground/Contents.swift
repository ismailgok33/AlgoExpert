import UIKit

class Program {
    // This is an input class. Do not edit.
    class BinaryTree {
        var value: Int
        var left: BinaryTree?
        var right: BinaryTree?
        
        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
    }
    
    // Solution-1
    // Time: O(n) where n is the number of the nodes in the tree
    // Space: O(h) where h is the height of the tree
    struct TreeInfo {
        let isBalanced: Bool
        let height: Int
    }
    
    func heightBalancedBinaryTree(_ tree: BinaryTree) -> Bool {
        
        return getTreeInfo(tree).isBalanced
    }
    
    func getTreeInfo(_ node: BinaryTree?) -> TreeInfo {
        guard let node = node else { return TreeInfo(isBalanced: true, height: -1) }
        
        let leftSubtree = getTreeInfo(node.left)
        let rightSubtree = getTreeInfo(node.right)
        
        let isBalanced = leftSubtree.isBalanced && rightSubtree.isBalanced && abs(leftSubtree.height - rightSubtree.height) <= 1
        let height = max(leftSubtree.height, rightSubtree.height) + 1
        
        return TreeInfo(isBalanced: isBalanced, height: height)
    }
    
}
