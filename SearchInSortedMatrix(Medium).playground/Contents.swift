import UIKit

// Solution-1
// Time:
// Space:
func searchInSortedMatrix(matrix: [[Int]], target: Int) -> [Int] {
    
    guard !matrix.isEmpty else { return [-1, -1] }
    
    var row = 0 // first row
    var col = matrix[0].count - 1 // last column
    
    while row < matrix.count, col >= 0 {
        if target < matrix[row][col] {
            col -= 1
        }
        else if target > matrix[row][col] {
            row += 1
        }
        else {
            return [row, col]
        }
    }
    
    return [-1, -1]
}
