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
    
    // Solution-1:
    // Time: O(n) where n is the total number of nodes in the binary tree
    //(since bfs takes O(V + E) times which in the case of Binary Tree is less than 2N since V = N and E is N-1)
    // O(V + E) < O(2N) => O(N)
    // Space: O(n) (since we have a length-n array to store parent nodes etc)
    func findNodesDistanceK(_ tree: BinaryTree, _ target: Int, _ k: Int) -> [Int] {
        
        var nodesToParent = [Int: BinaryTree?]()
        populateNodesToParents(tree, nodesToParents: &nodesToParent, nil) // find every node's parents from their values
        
        let targetNode = getNodeFromValue(target, tree, nodesToParent: nodesToParent) // gets the binaryTree from its value
        
        
        return breadthFirstSearchForNodesDistanceK(targetNode, nodesToParent, k)
    }
    
    func breadthFirstSearchForNodesDistanceK(_ targetNode: BinaryTree, _ nodesToParent: [Int: BinaryTree?], _ k: Int) -> [Int] {
        
        var queue: [(BinaryTree, Int)] = [(targetNode, 0)] // stores every node and their distance from the target node as a tuple
        var seen: Set<Int> = [targetNode.value] // stores previously visited nodes while bfs traversing in order to prevent them adding to the result again
        
        while queue.count > 0 {
            let currentItem = queue.removeFirst() // we can use a custom data structure in order to make removeFirst() operation better than O(n)
            let currentNode = currentItem.0
            let distanceFromTarget = currentItem.1
            
            if distanceFromTarget == k {
                // if the current element's distance is equal to k, then all of the nodes currently in the queue should have the same distance
                //since it is a bfs and every nodes should be at the same distance
                var nodesDistanceK = [Int]()
                
                for item in queue {
                    nodesDistanceK.append(item.0.value)
                }
                
                nodesDistanceK.append(currentItem.0.value)
                return nodesDistanceK
            }
            
            let connectedNodes = [currentNode.left, currentNode.right, nodesToParent[currentNode.value]!] // get the neighbor nodes including the parent
            for node in connectedNodes {
                if node == nil {
                    continue
                }
                
                if seen.contains(node!.value) {
                    continue
                }
                
                seen.insert(node!.value)
                queue.append((node!, distanceFromTarget + 1))
            }
        }
        
        return [Int]()
    }
    
    func getNodeFromValue(_ value: Int, _ tree: BinaryTree, nodesToParent: [Int: BinaryTree?]) -> BinaryTree {
        // gets the binaryTree from its value
        if tree.value == value {
            return tree
        }
        
        let parentNode = nodesToParent[value]!
        if parentNode!.left != nil, parentNode!.left!.value == value {
            return parentNode!.left!
        }
        
        return parentNode!.right!
    }
    
    func populateNodesToParents(_ node: BinaryTree?, nodesToParents: inout [Int: BinaryTree?], _ parent: BinaryTree?) {
        // find every node's parents from their values
        if node != nil {
            nodesToParents[node!.value] = parent
            populateNodesToParents(node!.left, nodesToParents: &nodesToParents, node)
            populateNodesToParents(node!.right, nodesToParents: &nodesToParents, node)
        }
    }
    
    // Solution-2:
    // Time: O(n) where n is the total number of nodes in the binary tree
    // Space: O(n)
    func findNodesDistanceK2(_ tree: BinaryTree, _ target: Int, _ k: Int) -> [Int] {
        
        var nodesDistanceK = [Int]()
        findDistanceFromNodeToTarget(tree, target, k, &nodesDistanceK)
        
        return nodesDistanceK
      }
    
    func findDistanceFromNodeToTarget(_ node: BinaryTree?, _ target: Int, _ k: Int, _ nodesDistanceK: inout [Int]) -> Int {

        if node == nil {
            return -1
        }
        
        if node!.value == target {
            addSubtreeNodesAtDistanceK(node, 0, k, &nodesDistanceK)
            return 1
        }
        
        let leftDistance = findDistanceFromNodeToTarget(node!.left, target, k, &nodesDistanceK)
        let rightDistance = findDistanceFromNodeToTarget(node!.right, target, k, &nodesDistanceK)
        
        if leftDistance == k || rightDistance == k {
            nodesDistanceK.append(node!.value)
        }
        
        if leftDistance != -1 {
            addSubtreeNodesAtDistanceK(node!.right, leftDistance + 1, k, &nodesDistanceK)
            return leftDistance + 1
        }
        
        if rightDistance != -1 {
            addSubtreeNodesAtDistanceK(node!.left, rightDistance + 1, k, &nodesDistanceK)
            return rightDistance + 1
        }
        
        return -1
    }
    
    func addSubtreeNodesAtDistanceK(_ node: BinaryTree?, _ distance: Int, _ k: Int, _ nodesDistanceK: inout [Int]) {
        
        if node == nil {
            return
        }
        
        if distance == k {
            nodesDistanceK.append(node!.value)
        }
        else {
            addSubtreeNodesAtDistanceK(node!.left, distance + 1, k, &nodesDistanceK)
            addSubtreeNodesAtDistanceK(node!.right, distance + 1, k, &nodesDistanceK)
        }
    }
}

