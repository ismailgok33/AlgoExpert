import UIKit


class Program {
    class BST {
        var value: Int
        var left: BST?
        var right: BST?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    // Solution-1
    // Time: O(n) where n is the number of nodes in the tree
    // Space: O(n)
    func branchSums(root: BST) -> [Int] {
        var results = [Int]()
        
        branchSumsHelper(tree: root, currentSum: 0, sums: &results)
        
        return results
        
    }
    
    func branchSumsHelper(tree: BST?, currentSum: Int, sums: inout [Int]) {
        
        guard let tree = tree else {
            return
        }
        
        let newSum = currentSum + tree.value
        
        if tree.left == nil, tree.right == nil {
            sums.append(newSum)
            return
        }
        
        branchSumsHelper(tree: tree.left, currentSum: newSum, sums: &sums)
        branchSumsHelper(tree: tree.right, currentSum: newSum, sums: &sums)
    }
    
    
}
