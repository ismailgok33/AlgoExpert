import UIKit

// Solution-1
// Time: O(n^2) where n is the lenght of the array. It will be O(n^2) even if the array is sorted since both of the loops go through to end of the array regardless
// Space: O(1)
func selectionSort(array: inout [Int]) -> [Int] {
    
    guard !array.isEmpty else { return [] }
    
    var currentIndex = 0
    var indexOfSmallest = 0
    
    while currentIndex < array.count - 1 {
        indexOfSmallest = currentIndex
        
        for i in (currentIndex + 1) ..< array.count {
            if array[indexOfSmallest] > array[i] {
                indexOfSmallest = i
            }
        }
        array.swapAt(currentIndex, indexOfSmallest)
        currentIndex += 1
    }
    
    return array
}

var array = [8, 5, 2, 9, 5, 6, 3]
print(selectionSort(array: &array))
