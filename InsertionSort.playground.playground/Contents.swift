import UIKit

// Solution-1
// Time: Best: O(n) where n is the length of the array. This is true when the array is given as sorted correctly
// Avg - Worst: O(n^2)
// Space: O(1)
func insertionSort(array: inout [Int]) -> [Int] {
    
    guard !array.isEmpty else { return [] }
    
    for i in 1 ..< array.count {
        var j = i
        
        while j > 0, array[j] < array[j-1] {
            array.swapAt(j, j-1)
            j -= 1
        }
    }
    
    return array
}

var array = [8, 5, 2, 9, 5, 6, 3]
print(insertionSort(array: &array))
