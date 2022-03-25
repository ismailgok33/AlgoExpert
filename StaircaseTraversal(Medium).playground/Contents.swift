import UIKit

// Solution-1: Basic Recursive approach
// Time: O(m^h) where m is the maxSteps and h is the height because of the recursion tree. Check the recap for the explanation.
// Space: O(h). Since the height of the recursion tree is h.
func staircaseTraversal(_ height: Int, _ maxSteps: Int) -> Int {
    
    // base cases
    if height == 1 || height == 0 {
        return 1
    }
    
    var numberOfWays = 0
    
    for i in 1 ... min(maxSteps, height) {
        numberOfWays += staircaseTraversal(height - i, maxSteps)
    }
    
    return numberOfWays
}

// Solution-2: Recursive approach with Memoizaiton
// Time: O(m x h) where m is the maxSteps and h is the height because of the recursion tree. Check the recap for the explanation.
// Space: O(h). Since the memoization dictionary has h elements
func staircaseTraversal2(_ height: Int, _ maxSteps: Int) -> Int {
    
    var memoization = [0 : 1, 1 : 1]
    return numberOfWaysToTheTop(height, maxSteps, &memoization)
    
}

func numberOfWaysToTheTop(_ height: Int, _ maxSteps: Int, _ memoization: inout [Int: Int]) -> Int {
    
    if memoization[height] != nil {
        return memoization[height]!
    }
    
    var numberOfWays = 0
    
    for i in 1 ... min(maxSteps, height) {
        numberOfWays += numberOfWaysToTheTop(height - i, maxSteps, &memoization)
    }
    
    memoization[height] = numberOfWays
    
    return numberOfWays
}

// Solution-3: Iterative approach - (Dynamic Programming)
// Time: O(m x h) where m is the maxSteps and h is the height
// Space: O(h)
func staircaseTraversal3(_ height: Int, _ maxSteps: Int) -> Int {
    var waysToTop = [Int](repeating: 0, count: height + 1)
    
    waysToTop[0] = 1
    waysToTop[1] = 1
    
    for currentHeight in stride(from: 2, to: height + 1, by: 1) {
        var step = 1
        
        while step <= maxSteps, step <= currentHeight {
            waysToTop[currentHeight] += waysToTop[currentHeight - step]
            step += 1
        }
    }
    
    return waysToTop.last!
    
}


// Solution-4: Iterative approach - (Sliding Window)
// Time: O(h) where h is the height
// Space: O(h)
func staircaseTraversal4(_ height: Int, _ maxSteps: Int) -> Int {
    var currentNumberOfWays = 0
    var waysToTop = [1]
    
    for currentHeight in stride(from: 1, to: height + 1, by: 1) {
        let startOfWindow = currentHeight - maxSteps - 1
        let endOfWindow = currentHeight - 1
        
        if startOfWindow >= 0 {
            currentNumberOfWays -= waysToTop[startOfWindow]
        }
        
        currentNumberOfWays += waysToTop[endOfWindow]
        
        waysToTop.append(currentNumberOfWays)
    }
    
    return waysToTop.last!
}
