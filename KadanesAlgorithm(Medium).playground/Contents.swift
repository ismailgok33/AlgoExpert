import UIKit

func kadanesAlgorithm(array: [Int]) -> Int {
    
    guard !array.isEmpty else { return -1 }
        
    var maxSum = array[0]
    var currentSum = array[0]
    
    for i in 1 ..< array.count {
        currentSum = max(currentSum + array[i], array[i])
        maxSum = max(maxSum, currentSum)
    }
    
    return maxSum
}
