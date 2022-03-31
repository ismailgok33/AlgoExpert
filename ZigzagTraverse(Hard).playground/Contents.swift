import UIKit

// Solution-1:
// Time: O(m x n) where m and n is the dimensions of the array
// Space: O(m x n)
func zigZagTraverse(array: [[Int]]) -> [Int] {
    
    var result = [Int]()
    
    var goingDown = true
    var currentRow = 0
    var currentColumn = 0
    
    while currentRow < array.count, currentColumn < array[0].count {
        result.append(array[currentRow][currentColumn])
        
        if goingDown {
            if currentColumn == 0 || currentRow == array.count - 1 {
                goingDown = false
                if currentRow == array.count - 1 {
                    currentColumn += 1
                }
                else {
                    currentRow += 1
                }
            }
            else {
                currentRow += 1
                currentColumn -= 1
            }
        }
        else {
            if currentRow == 0 || currentColumn == array[0].count - 1 {
                goingDown = true
                if currentColumn == array[0].count - 1 {
                    currentRow += 1
                }
                else {
                    currentColumn += 1
                }
            }
            else {
                currentRow -= 1
                currentColumn += 1
            }
        }
    }
    
    return result
}
