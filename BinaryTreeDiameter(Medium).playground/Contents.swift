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
    // Time: O(n) where n is the number of nodes in the tree since we apply DFS to the tree
    // Space: Avg: O(h) where h is the height of tree. - Worst: O(n) since a tree can have only left childs or right childs
    class TreeInfo {
        let diameter: Int
        let height: Int
        
        init(_ diameter: Int, _ height: Int) {
            self.diameter = diameter
            self.height = height
        }
    }
    
    func binaryTreeDiameter(_ tree: BinaryTree) -> Int {
        return getTreeInfo(tree).diameter
    }
    
    func getTreeInfo(_ tree: BinaryTree?) -> TreeInfo {
        guard let tree = tree else { return TreeInfo(0, 0) }
        
        let leftTreeInfo = getTreeInfo(tree.left)
        let rightTreeInfo = getTreeInfo(tree.right)
        
        let longestPathTroughRoot = leftTreeInfo.height + rightTreeInfo.height
        let maxDiameterSoFar = max(leftTreeInfo.diameter, rightTreeInfo.diameter)
        let currentDiameter = max(longestPathTroughRoot, maxDiameterSoFar)
        let currentHeight = max(leftTreeInfo.height, rightTreeInfo.height) + 1
        
        return TreeInfo(currentDiameter, currentHeight)
    }
}
