import UIKit

// Solution-1: Dynamic Programming Approach
// Time: O(n) where n is the lenght of the heights array
// Space: O(n)
func waterArea(heights: [Int]) -> Int {
    var maxes = [Int](repeating: 0, count: heights.count)
    var leftMax = 0
    
    for i in 0 ..< heights.count {
        let currentHeight = heights[i]
        
        maxes[i] = leftMax
        
        leftMax = max(leftMax, currentHeight)
    }
    
    var rightMax = 0
    
    for i in (0 ..< heights.count).reversed() {
        let currentHeight = heights[i]
        
        let minMax = min(rightMax, maxes[i])
        if currentHeight < minMax {
            maxes[i] = minMax - currentHeight
        }
        else {
            maxes[i] = 0
        }
        
        rightMax = max(rightMax, currentHeight)
    }
    
    return maxes.reduce(0) { $0 + $1 }
}

// Solution-2: Dynamic Programming Approach - Better
// Time: O(n) where n is the lenght of the heights array
// Space: O(1)
func waterArea2(heights: [Int]) -> Int {
    if heights.count == 0 {
        return 0
    }
    
    var leftIndex = 0
    var rightIndex = heights.count - 1
    var leftMax = heights[leftIndex]
    var rightMax = heights[rightIndex]
    var surfaceArea = 0
    
    while leftIndex < rightIndex {
        if heights[leftIndex] < heights[rightIndex] {
            leftIndex += 1
            leftMax = max(leftMax, heights[leftIndex])
            surfaceArea += leftMax - heights[leftIndex]
        }
        else {
            rightIndex -= 1
            rightMax = max(rightMax, heights[rightIndex])
            surfaceArea += rightMax - heights[rightIndex]
        }
    }
    
    return surfaceArea
}
