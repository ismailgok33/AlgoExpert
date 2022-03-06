import UIKit

func minimumNumberOfCoinsForChange(target: Int, denominations: [Int]) -> Int {
    
//    var numberOfCoins = [Int](repeating: Int(Int16.max), count: target + 1)
    var numberOfCoins = Array(repeating: Int(Int16.max), count: target + 1)
    numberOfCoins[0] = 0
    
    for denom in denominations {
        for amount in 0 ..< numberOfCoins.count {
            if denom <= amount {
                let remainder = amount - denom
                numberOfCoins[amount] = min(1 + numberOfCoins[remainder], numberOfCoins[amount])
            }
        }
    }
    
    return numberOfCoins[target] != Int(Int16.max) ? numberOfCoins[target] : -1
}
