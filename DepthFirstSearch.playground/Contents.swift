import UIKit

class Program {
    
    class Node {
        let name: String
        var children: [Node]
        
        init(name: String) {
            self.name = name
            children = []
        }
        
        func addChild(name: String) -> Node {
            let childNode = Node(name: name)
            children.append(childNode)
            
            return self
        }
        
        // Solution-1
        // Time: O(V+E) where V is the number of Vertices and E is the number of Edges
        // Space: O(V)
        func depthFirstSearch(array: inout [String]) -> [String] {
            
            array.append(name)
            
            for child in children {
                child.depthFirstSearch(array: &array)
            }
            
            return array
        }
    }
    
    
}

