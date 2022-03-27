import UIKit

// Solution-1
// Time: O(n) where n is the lenght of the buildings array
// Space: O(n)
func sunsetViews(_ buildings: [Int], _ direction: String) -> [Int] {
    
    var currentMax = Int.min
    var result = [Int]()
    
    if direction == "EAST" {
        for i in stride(from: buildings.count - 1, through: 0, by: -1) {
            if buildings[i] > currentMax {
                currentMax = buildings[i]
                result.append(i)
            }
        }
        
        result = result.reversed()
    }
    else {
        for i in 0 ..< buildings.count {
            if buildings[i] > currentMax {
                currentMax = buildings[i]
                result.append(i)
            }
        }
    }
    
    return result
}

// Solution-2: Same - Stack approach
// Time: O(n) where n is the lenght of the buildings array
// Space: O(n)
func sunsetViews2(_ buildings: [Int], _ direction: String) -> [Int] {
    
    var stack = [Int]()
    
    var startIndex = buildings.count - 1
    var step = -1
    
    if direction == "EAST" {
        startIndex = 0
        step = 1
    }
    
    var index = startIndex
    while index >= 0, index < buildings.count {
        let buildingHeight = buildings[index]
        
        while stack.count > 0, buildings[stack.last!] <= buildingHeight {
            stack.popLast()
        }
        
        stack.append(index)
        index += step
    }
    
    if direction == "WEST" {
        stack.reverse()
    }
    
    return stack
}
