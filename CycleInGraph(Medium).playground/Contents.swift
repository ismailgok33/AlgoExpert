import UIKit

// Solution-1
// Time: O(V + E) where V is the number of vertices and E is the number of edges in the graph
// Space: O(V) since we have 2 V lenght Bool arrays
func cycleInGraph(_ edges: [[Int]]) -> Bool {
    let numberOfNodes = edges.count
    var visited = [Bool](repeating: false, count: numberOfNodes)
    var inCallStack = [Bool](repeating: false, count: numberOfNodes)

    for i in 0 ..< numberOfNodes {
        if visited[i] {
            continue
        }
        
        let containsCycle = isNodeInCycle(edges, i, &visited, &inCallStack)
        if containsCycle {
            return true
        }
    }
    
    return false
}

func isNodeInCycle(_ edges: [[Int]], _ node: Int, _ visited: inout [Bool], _ inCallStack: inout [Bool]) -> Bool {
    visited[node] = true
    inCallStack[node] = true
    
    let neighbors = edges[node]
    
    for neighbor in neighbors {
        if !visited[neighbor] {
            let containsCycle = isNodeInCycle(edges, neighbor, &visited, &inCallStack)
            
            if containsCycle {
                return true
            }
        }
        else if inCallStack[neighbor] {
            return true
        }
    }
    
    inCallStack[node] = false // remove it from inCallStack when it's completed
    
    return false
}

// Solution-2 - Same. (using WHITE-GRAY-BLACK coloring the graph)
// Time: O(V + E) where V is the number of vertices and E is the number of edges in the graph
// Space: O(V) since we have 2 V lenght Bool arrays
let WHITE = 0
let GRAY = 1
let BLACK = 2

func cycleInGraph2(_ edges: [[Int]]) -> Bool {
    let numberOfNodes = edges.count
    var colors = [Int](repeating: WHITE, count: numberOfNodes)

    for i in 0 ..< numberOfNodes {
        if colors[i] != WHITE {
            continue
        }
        
        let containsCycle = isNodeInCycle2(edges, i, &colors)
        if containsCycle {
            return true
        }
    }
    
    return false
}

func isNodeInCycle2(_ edges: [[Int]], _ node: Int, _ colors: inout [Int]) -> Bool {
    colors[node] = GRAY
    
    let neighbors = edges[node]
    
    for neighbor in neighbors {
        if colors[neighbor] == WHITE {
            let containsCycle = isNodeInCycle2(edges, neighbor, &colors)
            
            if containsCycle {
                return true
            }
        }
        else if colors[neighbor] == GRAY {
            return true
        }
        else { // if colors[neighbor] == BLACK
            continue
        }
    }
    
    colors[node] = BLACK // remove it from inCallStack when it's completed
    
    return false
}
