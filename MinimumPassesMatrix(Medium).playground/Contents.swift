import UIKit

// Solution-1
// Time: O(m x n) where m and n are the width and height of the matrix
// Space: O(m x n)
func minimumPassesOfMatrix(_ matrix: inout [[Int]]) -> Int {
    let passes = convertNegatives(&matrix)
    if !containsNegatives(&matrix) {
        return passes - 1
    }
    else {
        return -1
    }
    
}

func convertNegatives(_ matrix: inout [[Int]]) -> Int {
    var nextPassQueue = getAllPositivePositions(&matrix)
    
    var passes = 0
    
    while nextPassQueue.count > 0 {
        var currentPassQueue = nextPassQueue
        nextPassQueue = [(Int, Int)]()
        
        while currentPassQueue.count > 0 {
            let firstElement = currentPassQueue[0]
            currentPassQueue.removeFirst() // this operation takes O(n) times in Swift but I'll count it O(1) since we can write a custom removefirst
            // method that runs on O(1) times
            let (currentRow, currentCol) = (firstElement.0, firstElement.1)
            
            let adjacentPositions = getAdjacentPositions(currentRow, currentCol, &matrix)
            for position in adjacentPositions {
                let (row, col) = (position.0, position.1)
                
                let value = matrix[row][col]
                if value < 0 {
                    matrix[row][col] *= -1
                    nextPassQueue.append((row, col))
                }
            }
        }
        passes += 1
    }
    
    return passes
}

func getAllPositivePositions(_ matrix: inout [[Int]]) -> [(Int, Int)] {
    var positivePositions = [(Int, Int)]()
    for row in 0 ..< matrix.count {
        for col in 0 ..< matrix[row].count {
            let value = matrix[row][col]
            if value > 0 {
                positivePositions.append((row, col))
            }
        }
    }
    return positivePositions
}

func getAdjacentPositions(_ row: Int, _ col: Int, _ matrix: inout [[Int]]) -> [(Int, Int)] {
    var adjacentPositions = [(Int, Int)]()
    
    if row > 0 {
        adjacentPositions.append((row - 1, col))
    }
    
    if row < matrix.count - 1 {
        adjacentPositions.append((row + 1, col))
    }
    
    if col > 0 {
        adjacentPositions.append((row, col - 1))
    }
    
    if col < matrix[0].count - 1 {
        adjacentPositions.append((row, col + 1))
    }
    
    return adjacentPositions
}

func containsNegatives(_ matrix: inout [[Int]]) -> Bool {
    for row in matrix {
        for value in row {
            if value < 0 {
                return true
            }
        }
    }
    return false
}
