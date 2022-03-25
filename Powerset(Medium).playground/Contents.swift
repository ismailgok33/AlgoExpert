import UIKit

// Solution-1: Iterative approach
// Time: O(2^n * n) where n is the lenght of the array since the subset of n length array contains 2^n elements
// Space: O(2^n * n) since we are storing 2^n arrays in which on average there are n/2 elements
func powerset(array: [Int], index: Int? = nil) -> [[Int]] {
    var subsets: [[Int]] = [[]]
    
    for num in array {
        for subset in subsets {
            subsets.append(subset + [num])
        }
    }
    
    return subsets
}

// Solution-2: Recursive approach
// Time: O(2^n * n)
// Space: O(2^n * n)
func powerset2(array: [Int], index: Int? = nil) -> [[Int]] {
    var idx: Int? = index
    
    if idx == nil {
        idx = array.count - 1
    }
    
    if idx! < 0 { // base case
        return [[]]
    }
    
    let element = array[idx!]
    
    var subsets = powerset2(array: array, index: idx! - 1)
    
    for subset in subsets {
        subsets.append(subset + [element])
    }
    
    return subsets
}
