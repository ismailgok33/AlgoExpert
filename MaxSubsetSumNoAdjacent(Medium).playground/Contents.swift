import UIKit

// Solution-1
// Time: O(n) where n is the lenght of the array
// Space: O(n)
func maximumSubsetSum(array: [Int]) -> Int {
    
    if array.count == 0 {
        return 0
    }
    
    if array.count == 1 {
        return array.first!
    }
    
    var maxSums = array
    maxSums[1] = max(array[0], array[1])
    
    for i in 2 ..< array.count {
        maxSums[i] = max(maxSums[i - 1], maxSums[i - 2] + array[i])
    }
    
    return maxSums.last!
}

// Solution-2
// Time: O(n) where n is the lenght of the array
// Space: O(1)
func maximumSubsetSum2(array: [Int]) -> Int {
    
    if array.count == 0 {
        return 0
    }
    
    if array.count == 1 {
        return array.first!
    }
    
    var second = array[0]
    var first = max(array[1], second)
    var currentSum = first
    
    for i in 2 ..< array.count {
        currentSum = max(first, second + array[i])
        second = first
        first = currentSum
    }
    
    return currentSum
}
