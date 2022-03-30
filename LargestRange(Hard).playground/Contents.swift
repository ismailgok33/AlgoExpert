import UIKit

// Solution-1: Sort the array and check the largest range
// Time: O(nlogn) where n is the length of the array
// Space: O(n)


// Solution-2:
// Time: O(n) where n is the lenght of the array
// Space: O(n)
func largestRange(array: [Int]) -> [Int] {
    
    var dict = [Int: Bool]()
    var bestRange = [Int]()
    var longestRange = 0
    
    for number in array {
        dict[number] = true
    }
    
    for number in array {
        if let dictAtNumber = dict[number], !dictAtNumber { // check if the number is already included in a range
            continue
        }
        
        var currentRange = 1
        var left = number - 1
        var right = number + 1
        
        while dict.keys.contains(left) {
            currentRange += 1
            dict[left] = false // set this as included
            left -= 1
        }
        
        while dict.keys.contains(right) {
            currentRange += 1
            dict[right] = false // set this as included
            right += 1
        }
        
        if currentRange > longestRange {
            longestRange = currentRange
            bestRange = [left + 1, right - 1]
        }
        
    }
    
    return bestRange
}
