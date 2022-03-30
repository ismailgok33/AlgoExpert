import UIKit

// Solution-1:
// Time: Average: O(n^2) - Worst: O(n^3) where n is the lenght of the array
// Worst case time complexity occurs when all sums are set to the same key in the dictionary.
// So when we iterate all pairs (line 17) it could be a O(n) rather than O(1)
// Space: O(n^2)
func fourNumberSum(array: [Int], targetSum: Int) -> [[Int]] {
    var allPairSums = [Int: [[Int]]]() // dict
    var quadruplets = [[Int]]() // result
    
    for i in 1 ..< array.count - 1 { // start from 1 since if we start from 0, the code does nothing for first iteration (when i = 0)
        for j in i + 1 ..< array.count {
            let currentSum = array[i] + array[j]
            let difference = targetSum - currentSum
            
            if allPairSums.keys.contains(difference) {
                for pair in allPairSums[difference]! {
                    quadruplets.append(pair + [array[i], array[j]])
                }
            }
        }
        
        for k in 0 ..< i {
            let currentSum = array[k] + array[i]
            
//            if allPairSums[currentSum] == nil {
            if !allPairSums.keys.contains(currentSum) {
                allPairSums[currentSum] = [[array[k], array[i]]]
            }
            else {
                allPairSums[currentSum]!.append([array[k], array[i]])
            }
        }
    }
    
    return quadruplets
}
