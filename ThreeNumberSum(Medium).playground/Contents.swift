import UIKit

// Solution-1
// Time: O(n^2) where n is the length of the array
// Space: O(n)
func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {

    var results = [[Int]]()
    guard !array.isEmpty else { return results }
    
    array.sort()
    
    for i in 0 ..< array.count - 2 {
        var leftPointer = i + 1
        var rigthPointer = array.count - 1
        
        while leftPointer < rigthPointer {
            let currentSum = array[i] + array[leftPointer] + array[rigthPointer]
            
            if currentSum == targetSum {
                results.append([array[i], array[leftPointer], array[rigthPointer]])
                leftPointer += 1
                rigthPointer -= 1
            }
            else if currentSum < targetSum {
                leftPointer += 1
            }
            else {
                rigthPointer -= 1
            }
        }
    }
    
    return results
}

var array = [12, 3, 1, 2, -6, 5, -8, 6]
var target = 0
print(threeNumberSum(array: &array, targetSum: target))

