import UIKit

// Solution-1
// Time: O(n * m) where n and m are the length of the arrays
// Space: O(1)
func smallestDifference(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
    
    var result = [Int]()
    var closestDiff = Int.max
    
    for i in 0 ..< arrayOne.count {
        for j in 0 ..< arrayTwo.count {
            let currentDiff = abs(arrayOne[i] - arrayTwo[j])
            if currentDiff < closestDiff {
                closestDiff = currentDiff
                result = [arrayOne[i], arrayTwo[j]]
            }
        }
    }
    
    return result
}

var arrayOne = [-1, 5, 10, 20, 28, 3]
var arrayTwo = [26, 134, 135, 15, 17]
//print(smallestDifference(arrayOne: &arrayOne, arrayTwo: &arrayTwo))

// Solution-2
// Time: O(nlogn + mlogm) where n and m are the lenght of the arrays
// Space: O(1)
func smallestDifference2(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
    
    var result = [Int]()
   
    arrayOne.sort()
    arrayTwo.sort()
    
    var smallestDiff = Int.max
    var pointerOne = 0
    var pointerTwo = 0
    
    while pointerOne < arrayOne.count, pointerTwo < arrayTwo.count {
        let currentDiff = abs(arrayOne[pointerOne] - arrayTwo[pointerTwo])
        
        if currentDiff < smallestDiff {
            smallestDiff = currentDiff
            result = [arrayOne[pointerOne], arrayTwo[pointerTwo]]
        }
        
        if arrayOne[pointerOne] < arrayTwo[pointerTwo] {
            pointerOne += 1
        }
        else if arrayOne[pointerOne] > arrayTwo[pointerTwo] {
            pointerTwo += 1
        }
        else { // if equals. You find it
            return [arrayOne[pointerOne], arrayTwo[pointerTwo]]
        }
    }
    
    return result
}

print(smallestDifference2(arrayOne: &arrayOne, arrayTwo: &arrayTwo))
