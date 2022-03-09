import UIKit

// Solution-1
// Time: O(m x n) where m and n are the width and height of the tree
// Space: O(m x n)
func removeIslands(_ matrix: inout [[Int]]) -> [[Int]] {
    
    var visited: [[Bool]] = matrix.map({ $0.map({ $0 == 2 })})
    
    for i in 0 ..< matrix.count {
        if matrix[i][0] == 1 {
            getUnvisitedNeighbors(&matrix, &visited, i, 0)
        }
        if matrix[i][matrix[0].count - 1] == 1 {
            getUnvisitedNeighbors(&matrix, &visited, i, matrix[0].count - 1)
        }
    }
    
    for i in 0 ..< matrix[0].count {
        if matrix[0][i] == 1 {
            getUnvisitedNeighbors(&matrix, &visited, 0, i)
        }
        if matrix[matrix.count - 1][i] == 1 {
            getUnvisitedNeighbors(&matrix, &visited, matrix.count - 1, i)
        }
    }
    
    for i in 0 ..< matrix.count {
        for j in 0 ..< matrix[0].count {
            if matrix[i][j] == 1, !visited[i][j]  {
                matrix[i][j] = 0
            }
        }
    }
    
    return matrix
}

func getUnvisitedNeighbors(_ matrix: inout [[Int]], _ visited: inout [[Bool]], _ i: Int, _ j: Int) {
    var stack = [[i, j]]
    
    while stack.count > 0 {
        let nodeIndices = stack.removeLast()
        
        let row = nodeIndices[0]
        let col = nodeIndices[1]
        visited[row][col] = true
        
        if row > 1, !visited[row - 1][col] {
            visited[row - 1][col] = true
            
            if matrix[row - 1][col] == 1 {
                stack.append([row - 1, col])
            }
        }
        
        if row < matrix.count - 1, !visited[row + 1][col] {
            visited[row + 1][col] = true
            
            if matrix[row + 1][col] == 1 {
                stack.append([row + 1, col])
            }
        }
        
        if col > 1, !visited[row][col - 1] {
            visited[row][col - 1] = true
            
            if matrix[row][col - 1] == 1 {
                stack.append([row, col - 1])
            }
        }
        
        if col < matrix[0].count - 1, !visited[row][col + 1] {
            visited[row][col + 1] = true
            
            if matrix[row][col + 1] == 1 {
                stack.append([row, col + 1])
            }
        }
    }
}

var array = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  ]

print(removeIslands(&array))
