import UIKit

// Solution-1:
// Time: O(n) where n is the lenght of the array
// Space: O(1)
func subarraySort(array: [Int]) -> [Int] {
    var maximumOutOfOrder = Int.min
    var minimumOutOfOrder = Int.max
    
    for i in 0 ..< array.count {
        let currentNumber = array[i]
        if isOutOfOrder(i, array, currentNumber) {
            maximumOutOfOrder = max(maximumOutOfOrder, currentNumber)
            minimumOutOfOrder = min(minimumOutOfOrder, currentNumber)
        }
    }
    
    if minimumOutOfOrder == Int.max || maximumOutOfOrder == Int.min {
        return [-1, -1]
    }
    
    var leftPointer = 0
    while minimumOutOfOrder >= array[leftPointer] {
        leftPointer += 1
    }
    
    var rightPointer = array.count - 1
    while maximumOutOfOrder <= array[rightPointer] {
        rightPointer -= 1
    }
    
    return [leftPointer, rightPointer]
}

func isOutOfOrder(_ i: Int, _ array: [Int], _ currentNumber: Int) -> Bool {
    if i == 0 {
        return currentNumber > array[i + 1]
    }
    else if i == array.count - 1 {
        return currentNumber < array[i - 1]
    }
    else {
        return currentNumber > array[i + 1] || currentNumber < array[i - 1]
    }
}
