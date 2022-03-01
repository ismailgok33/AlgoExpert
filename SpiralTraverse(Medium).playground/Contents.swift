import UIKit

// Solution-1
// Time: O(N) where n is the total number of elements of the two dimentional array since we are traversing every single value once
// Space:  O(N)
func spiralTraverse(array: [[Int]]) -> [Int] {
    
    var results = [Int]()
    guard !array.isEmpty else { return results }
    
    var startRow = 0
    var endRow = array.count - 1
    var startCol = 0
    var endCol = array[0].count - 1
    
    while startRow <= endRow, startCol <= endCol {
        for col in stride(from: startCol, through: endCol, by: 1) {
            results.append(array[startRow][col])
        }
        
        for row in stride(from: startRow + 1, through: endRow , by: 1) {
            results.append(array[row][endCol])
        }
        
        for col in stride(from: endCol - 1, through: startCol, by: -1) {
            if startRow == endRow {
                break
            }
            results.append(array[endRow][col])
        }
        
        for row in stride(from: endRow - 1, through: startRow + 1, by: -1) {
            if startCol == endCol {
                break
            }
            results.append(array[row][startCol])
        }
        
        startRow += 1
        endRow -= 1
        startCol += 1
        endCol -= 1
    }
    
    return results
}

var array = [
    [1, 2, 3, 4],
    [12, 13, 14, 5],
    [11, 16, 15, 6],
    [10, 9, 8, 7]
  ]

//print(spiralTraverse(array: array))

// Solution-2 - Recursion (Same)
// Time: O(N) where n is the total number of elements of the two dimentional array since we are traversing every single value once
// Space:  O(N)
func spiralTraverse2(array: [[Int]]) -> [Int] {
    
    var result = [Int]()
    guard !array.isEmpty else { return result }
    
    spiralTraverseHelper(array, 0, array.count - 1, 0, array[0].count - 1, result: &result)
    
    return result
}

func spiralTraverseHelper(_ array: [[Int]], _ startRow: Int, _ endRow: Int, _ startCol: Int, _ endCol: Int, result: inout [Int]) {
    if startRow > endRow || startCol > endCol {
        return
    }
    
    for col in stride(from: startCol, through: endCol, by: 1) {
        result.append(array[startRow][col])
    }
    
    for row in stride(from: startRow + 1, through: endRow, by: 1) {
        result.append(array[row][endCol])
    }
    
    for col in stride(from: endCol - 1, through: startCol, by: -1) {
        if startRow == endRow {
            break
        }
        result.append(array[endRow][col])
    }
    
    for row in stride(from: endRow - 1, through: startRow + 1, by: -1) {
        if startCol == endCol {
            break
        }
        result.append(array[row][startCol])
    }
    
    spiralTraverseHelper(array, startRow + 1, endRow - 1, startCol + 1, endCol - 1, result: &result)
}

