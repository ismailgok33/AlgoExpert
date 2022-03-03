import UIKit

// Solution-1
// Time: O(n) where n is the length of the array
// Space: O(n)
func firstDuplicateValue(_ array: inout [Int]) -> Int {
    
    var dict = [Int: Int]()
    
    for elm in array {
        dict[elm, default: 0] += 1
        if dict[elm] == 2 {
            return elm
        }
    }
    
    return -1
}

var array = [2, 1, 5, 2, 3, 3, 4]
print(firstDuplicateValue(&array))

// Solution-2 - Better
// Time: O(n) where n is the length of the array
// Space: O(1)
func firstDuplicateValue2(_ array: inout [Int]) -> Int {
    
    for elm in array {
        if array[elm - 1] == 0 {
            return elm
        }
        
        array[elm - 1] = 0
    }
    
    return -1
}

print(firstDuplicateValue2(&array))
