import UIKit

// Solution-1
// Time: O(nlogn) where n is the lenght of the both of the arrays
// Space: O(1)
func tandemBicycle(_ redShirtSpeeds: inout [Int], _ blueShirtSpeeds: inout [Int], _ fastest: Bool) -> Int {
    
    var totalSpeed = 0
    redShirtSpeeds.sort()
    
    if fastest {
        blueShirtSpeeds.sort { $0 > $1 }
    }
    else {
        blueShirtSpeeds.sort()
    }
    
    for i in 0..<redShirtSpeeds.count {
        totalSpeed += max(redShirtSpeeds[i], blueShirtSpeeds[i])
    }
    
    return totalSpeed
}
