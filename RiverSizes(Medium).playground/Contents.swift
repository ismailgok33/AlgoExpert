import UIKit

// Solution-1 - This is iterative solution for DFS. We could also use recursion to travers DFS
// Time: O(m x n) where m and n is the widht and height of the two-dimentional matrix
// Space: O(m x n)
func riverSizes(_ matrix: [[Int]]) -> [Int] {
    var sizes = [Int]()
    guard !matrix.isEmpty else { return sizes }
    
//    var isVisited: [[Bool]] = Array(repeating: [Bool](repeating: false, count: matrix.count), count: matrix[0].count)
    var isVisited: [[Bool]] = matrix.map({ $0.map({ $0 == 2 })})
    
    for i in 0 ..< matrix.count {
        for j in 0 ..< matrix[0].count {
            if isVisited[i][j] {
                continue
            }
            traverseMatrix(i: i, j: j, matrix: matrix, isVisited: &isVisited, sizes: &sizes)
        }
    }
   
    return sizes
}

// Traverse the matrix DFS. We could traverse it either DFS (use Stacks) or BFS (use Queues)
func traverseMatrix(i: Int, j: Int, matrix: [[Int]], isVisited: inout [[Bool]], sizes: inout [Int]) {
    var nodesToExplore = [[i, j]]
    var currentRiverSize = 0
    var row = i
    var col = j
    
    while nodesToExplore.count > 0 {
        let currentNode = nodesToExplore.removeLast()
        
        row = currentNode[0]
        col = currentNode[1]
        
        if isVisited[row][col] {
            continue
        }
        
        isVisited[row][col] = true
        
        if matrix[row][col] == 0 {
            continue
        }
        
        currentRiverSize += 1
        
        let unVisitedNeighbors = getUnvisitedNeighbors(i: row, j: col, matrix: matrix, isVisited: &isVisited)
        
        for node in unVisitedNeighbors {
            nodesToExplore.append(node)
        }
        
    }
    
    if currentRiverSize > 0 {
        sizes.append(currentRiverSize)
    }
}

func getUnvisitedNeighbors(i: Int, j: Int, matrix: [[Int]], isVisited: inout [[Bool]]) -> [[Int]] {
    
    var unVisitedNeighbors = [[Int]]()
    
    if i > 0, !isVisited[i - 1][j] {
        unVisitedNeighbors.append([i - 1, j])
    }
    
    if i < matrix.count - 1, !isVisited[i + 1][j] {
        unVisitedNeighbors.append([i + 1, j])
    }
    
    if j > 0, !isVisited[i][j - 1] {
        unVisitedNeighbors.append([i, j - 1])
    }
    
    if j < matrix[0].count - 1, !isVisited[i][j + 1] {
        unVisitedNeighbors.append([i, j + 1])
    }
    
    return unVisitedNeighbors
}





var matrix = [
    [1, 0, 0, 1, 0],
    [1, 0, 1, 0, 0],
    [0, 0, 1, 0, 1],
    [1, 0, 1, 0, 1],
    [1, 0, 1, 1, 0]
  ]
