import UIKit

// Solution-1
// Time: O(n) where n is the length of the array
// Space: O(1)
func isMonotonic(array: [Int]) -> Bool {
    
    guard !array.isEmpty else { return true }
    guard array.count > 1 else { return true }
    
    var mono = -1 // 0 = non-decreasing, 1 = non-increasing

    if array.first! == array.last! {
        mono = -1 // cannot be known. Every element should be equal
    }
    else if array.first! < array.last! {
        mono = 0
    }
    else {
        mono = 1
    }
    
    for i in 0 ..< array.count - 1 {
        if mono == -1 {
            if array[i] != array[i+1] {
                return false
            }
        }
        else if mono == 0 {
            if array[i] > array[i+1] {
                return false
            }
        }
        else {
            if array[i] < array[i+1] {
                return false
            }
        }
    }
    
    return true
}

var array = [-1, -5, -10, -1100, -1100, -1101, -1102, -9001]
//print(isMonotonic(array: array))

// Solution-2 - Same (Shorter)
// Time: O(n) where n is the length of the array
// Space: O(1)
func isMonotonic2(array: [Int]) -> Bool {
    
    guard !array.isEmpty else { return true }
    guard array.count > 1 else { return true }
    
    var nonDecreasing = true
    var nonIncreasing = true
    
    for i in 0 ..< array.count - 1 {
        if array[i] > array[i + 1] {
            nonDecreasing = false
        }
        
        if array[i] < array[i + 1] {
            nonIncreasing = false
        }
    }
    
    return nonIncreasing || nonDecreasing
}

print(isMonotonic2(array: array))
