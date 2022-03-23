import UIKit

// Solution-1:
// Time: O(n) where n is the length og the distances and fuel
// Space: O(1)
func validStartingCity(_ distances: [Int], _ fuel: [Int], _ mpg: Int) -> Int {
    
    var index = 0
    var miles = 0
    
    for i in 0 ..< distances.count {
        miles += fuel[i] * mpg
        if distances[i] <= miles {
            miles -= distances[i]
            continue
        }
        else {
            if i == distances.count - 1 {
                index = 0
            }
            else {
                index = i + 1
            }
            miles = 0
        }
    }
    
    return index
}

// Solution-2: - Worse solution. Can be done with 2 for loops checking if the fuel is enough to go through.
// Time: O(n^2) where n is the length of the distances and fuel
// Space: O(1)


// Solution-3: - same with Solution-1
// Time: O(n) where n is the length of the distances and fuel
// Space: O(1)
func validStartingCity2(_ distances: [Int], _ fuel: [Int], _ mpg: Int) -> Int {
    
    var index = 0
    var minMiles = 0
    var remainingMiles = 0
  
    for i in 1 ..< distances.count {
        remainingMiles += fuel[i - 1] * mpg - distances[i - 1]
        
        if remainingMiles < minMiles {
            minMiles = remainingMiles
            index = i
        }
    }
    
    return index
}
