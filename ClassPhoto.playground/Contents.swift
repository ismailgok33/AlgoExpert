import UIKit

// Solution-1
// Time: O(nlogn) where n is the lenght of the both of the arrays
// Space O(1)
func classPhotos(_ redShirtHeights: inout [Int], _ blueShirtHeights: inout [Int]) -> Bool {
    
    guard !redShirtHeights.isEmpty else { return false }
    guard !blueShirtHeights.isEmpty else { return false }
    
    var blueCount = 0
    var redCount = 0
    
    redShirtHeights.sort()
    blueShirtHeights.sort()
    
    for i in 0..<redShirtHeights.count {
        if redShirtHeights[i] > blueShirtHeights[i] {
            redCount += 1
        }
        else if redShirtHeights[i] < blueShirtHeights[i] {
            blueCount += 1
        }
        else { // if they are equal, the
            return false
        }
    }
    
    if redCount == redShirtHeights.count || blueCount == blueShirtHeights.count {
        return true
    }
    
    return false
}
