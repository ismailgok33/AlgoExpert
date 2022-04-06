import UIKit

// Solution-1: Dynamic programming approach (creating smaller arrays and build up the solution from smaller ones)
// Time: O(n^2) where n is the lenght of the array
// Space: O(n)
func minNumberOfJumps(array: [Int]) -> Int {
    var jumps = [Int](repeating: Int.max, count: array.count)
    
    jumps[0] = 0
    
    for i in 0 ..< array.count {
        for j in 0 ..< i {
            if array[j] + j >= i {
                jumps[i] = min(jumps[i], jumps[j] + 1)
            }
        }
    }
    
    return jumps.last!
}

// Solution-2:
// Time: O(n) where n is the lenght of the array
// Space: O(1)
func minNumberOfJumps2(array: [Int]) -> Int {
    
    if array.count == 1 {
        return 0
    }
    
    var jumps = 0
    var steps = array[0]
    var maxReach = array[0]
    
    for i in 1 ..< array.count - 1 {
        maxReach = max(maxReach, array[i] + i)
        
        steps -= 1
        
        if steps == 0 {
            jumps += 1
            
            steps = maxReach - i
        }
    }
    
    return jumps + 1
}
