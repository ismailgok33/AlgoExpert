import UIKit

// Solution-1 - Recursion - Worst
// Time: O(2^(m+n)) where m and n is the width and the height. Since in every step the recursion will branch out 2 and the height of this recursion tree
// cannot be greater than m+n. So h <= m + n. We could say that O(2^h)
// Space: O(m + n) same reason. h <= m + n. We could say that O(h)
func numberOfWaysToTraverseGraph(_ width: Int, _ height: Int) -> Int {
    
    if width == 1 || height == 1 {
        return 1
    }
    
    return numberOfWaysToTraverseGraph(width - 1, height) + numberOfWaysToTraverseGraph(width, height - 1)
}

// Solution-2 - Dynamic Programming - Better
// Time: O(m x n) where m and n is the width and the height. Since we are traversing a two-dimensional array.
// Space: O(m x n)
func numberOfWaysToTraverseGraph2(_ width: Int, _ height: Int) -> Int {
    
    var numberOfWays = Array(repeating: [Int](), count: height + 1)
    for i in 0 ..< numberOfWays.count {
        numberOfWays[i] = Array(repeating: 0, count: width + 1)
    }
    
    for widthIndex in 1 ..< width + 1 {
        for heightIndex in 1 ..< height + 1 {
            if widthIndex == 1 || heightIndex == 1 {
                numberOfWays[heightIndex][widthIndex] = 1
            }
            else {
                let waysLeft = numberOfWays[heightIndex][widthIndex - 1]
                let waysUp = numberOfWays[heightIndex - 1][widthIndex]
                numberOfWays[heightIndex][widthIndex] = waysLeft + waysUp
            }
        }
    }
    
    return numberOfWays[height][width]
}

// Solution-3 - Permutation - Bonus
// Time: O(m + n) where m and n is the width and the height. Since creating factorials mean we need to traverse height and width seperately.
// Space: O(1)
func numberOfWaysToTraverseGraph3(_ width: Int, _ height: Int) -> Int {
    
    let rightDistance = width - 1
    let downDistance = height - 1
    let totalDistance = rightDistance + downDistance
    
    var rightFactorial = 1
    var downFactorial = 1
    var totalFactorial = 1
    
    // return  -> permutation -> (rightDistance + downDistance)! / rightDistance! * downDistance!
    
    for i in stride(from: 2, through: totalDistance, by: 1) {
        totalFactorial *= i
    }
    
    for i in stride(from: 2, through: rightDistance, by: 1) {
        rightFactorial *= i
    }
    
    for i in stride(from: 2, through: downDistance, by: 1) {
        downFactorial *= i
    }
    
    return totalFactorial / (rightFactorial * downFactorial)
}
