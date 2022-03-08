import UIKit

// Solution-1
// Time: O(n) where n is the lenght of the array
// Space: O(n)
func hasSingleCycle(array: [Int]) -> Bool {
    
    guard !array.isEmpty else { return false }
    
    var dict = [Int: Int]()
    
    var i = 0 // starting index
    if array.contains(0) { return false }
    
    while dict.count <= array.count {
        dict[i, default: 0] += 1
        
        if dict[i]! > 1 {
            return false
        }
        
        i += array[i]
        if i > array.count - 1 {
            i = i % array.count
        }
        
        while i < 0 {
            i = array.count + i
        }
        
        if i == 0 {
            break
        }
    }
    
    for j in 0 ..< array.count {
        if dict[j, default: 0] != 1 {
            return false
        }
    }
    
    return true
}


// Solution-2
// Time: O(n) where n is the lenght of the array
// Space: O(n)
func hasSingleCycle2(array: [Int]) -> Bool {
    
    guard !array.isEmpty else { return false }
    
    var currentIndex = 0
    var numberOfElementsVisited = 0
    
    while numberOfElementsVisited < array.count {
        if currentIndex == 0, numberOfElementsVisited > 0 {
            return false
        }
        
        numberOfElementsVisited += 1
        let nextIndex = currentIndex + array[currentIndex]
        currentIndex = nextIndex % array.count
        
        if currentIndex < 0 {
            currentIndex = currentIndex + array.count
        }
    }
    
    return currentIndex == 0 // if it ended on the start index which was 0
}
