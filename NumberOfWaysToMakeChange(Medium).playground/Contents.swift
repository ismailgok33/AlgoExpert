import UIKit

// Solution-1
// Time: O(nd) where n is the target number and d is the length of the denominations array
// Space: O(n)
func numberOfWaysToMakeChange(target: Int, denominations: [Int]) -> Int {
    
    var ways = [Int](repeating: 0, count: target + 1)
    ways[0] = 1
    
    for denom in denominations {
        for amount in 1 ..< ways.count {
            if denom <= amount {
                ways[amount] += ways[amount - denom]
            }
        }
    }
    
    return ways.last!
}
