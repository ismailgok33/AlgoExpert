import UIKit

// Solution-1 - Better Solution
// Time: O(Logn) where n is the length of the array
// Space: O(1)
func binarySearch(array: [Int], target: Int) -> Int {
    
    guard !array.isEmpty else { return -1 }
    
    var leftPointer = 0
    var rightPointer = array.count - 1
    var middle = 0
    
    while leftPointer <= rightPointer {
        middle = (rightPointer + leftPointer) / 2
        
        if array[middle] == target {
            return middle
        }
        else if target > array[middle] {
            leftPointer = middle + 1
        }
        else {
            rightPointer = middle - 1
        }
    }
    
    return -1
}

var array = [0, 1, 21, 33, 45, 45, 61, 71, 72, 73]
var target = 33

print(binarySearch(array: array, target: target))

// Solution-2
// Time: O(logn) where n is the lenght of the array
// Space: O(logn)
func binarySearch2(array: [Int], target: Int) -> Int {
    
    guard !array.isEmpty else { return -1 }
    
    return binarySearch2Helper(array: array, target: target, leftPointer: 0, rightPointer: array.count - 1)
}

func binarySearch2Helper(array: [Int], target: Int, leftPointer: Int, rightPointer: Int) -> Int {
    
    if leftPointer > rightPointer {
        return -1
    }
    
    let mid = (leftPointer + rightPointer) / 2
    
    if target == array[mid] {
        return mid
    }
    else if target > array[mid] {
        return binarySearch2Helper(array: array, target: target, leftPointer: mid + 1, rightPointer: rightPointer)
    }
    else {
        return binarySearch2Helper(array: array, target: target, leftPointer: leftPointer, rightPointer: mid - 1)
    }
}

print(binarySearch2(array: array, target: target))
