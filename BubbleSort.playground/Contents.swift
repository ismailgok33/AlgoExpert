import UIKit

// Solution-1
// Time: O(n^2) where n is the length of the array
// Space: O(1)
func bubbleSort(array: inout [Int]) -> [Int] {
    
    guard !array.isEmpty else { return [] }
    
    for i in 0 ..< array.count {
        for j in i+1 ..< array.count {
            if array[i] > array[j] {
                array.swapAt(i, j)
            }
        }
    }
    
    return array
}

// Solution-2 - Better
// Time: Best: O(n) where n is the length of the array. Best case is when the array is sorted it will only iterate the array once
// Avg - Worst: O(n^2)
// Space: O(1)
func bubbleSort2(array: inout [Int]) -> [Int] {
    
    guard !array.isEmpty else { return [] }
    
    var isSorted = false
    var counter = 0
    
    while !isSorted {
        isSorted = true
        
        for i in 0 ..< array.count - 1 - counter {
            if array[i] > array[i+1] {
                array.swapAt(i, i+1)
                isSorted = false
            }
        }
        
        counter += 1
    }
    
    return array
}
