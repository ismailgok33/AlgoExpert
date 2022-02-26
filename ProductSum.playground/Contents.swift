import UIKit

// Tip: You can cast each element with `as? [Any]` to check whether it is
// an array or an integer.

// Solution-1
// Time: O(n) where n is the total int values in all the array + subarrays combined
// Space: O(d) where d is the depth of the array (the depth of most inner array)
func productSum(_ array: [Any]) -> Int {
    var multiplier = 1
    return productSumHelper(array, &multiplier)
}

func productSumHelper(_ array: [Any], _ multiplier: inout Int) -> Int {
    var result = 0
    
    for elm in array {
        if let num = elm as? Int {
            result += num
        }
        else {
            multiplier += 1
            result += multiplier * productSumHelper(elm as! [Any], &multiplier)
            multiplier -= 1
        }
    }
    
    return result
}

var array: [Any] = [5, 2, [7, -1], 3, [6, [-13, 8], 4]]
print(productSum(array))
