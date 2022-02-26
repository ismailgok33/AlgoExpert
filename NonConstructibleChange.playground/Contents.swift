import UIKit

// Solution-1
// Time: O(nlogn) where n is the size of coins array (sorting is nlogn time)
// Space: O(1) - in place sorting
func nonConstructibleChange(_ coins: inout [Int]) -> Int {
    
    var currentChange = 0
    coins.sort()
    
    for coin in coins {
        if coin > currentChange + 1 {
            return currentChange + 1
        }
        currentChange += coin
    }
    
    return currentChange + 1
    
}

var coins = [5, 7, 1, 1, 2, 3, 22]
print(nonConstructibleChange(&coins))
