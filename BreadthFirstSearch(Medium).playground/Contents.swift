import UIKit

class Program {
    class Node {
        var name: String
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
        
        func breadthFirstSearch(array: inout [String]) -> [String] {
            
            var queue: [Node] = [self]
            
            while queue.count > 0 {
                let node = queue.removeFirst()
                array.append(node.name)
                
//                queue.append(contentsOf: node.children)
                for child in node.children {
                    queue.append(child)
                }
            }
            
            return array
        }
    }
}
