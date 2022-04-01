import UIKit

// Solution-1:
// Time: O(n^2) where n is the lenght of the two arrays (they should have equal length to pass the first condition)
// Space: O(n^2)
func sameBsts(_ arrayOne: [Int], _ arrayTwo: [Int]) -> Bool {
    
    if arrayOne.count != arrayTwo.count {
        return false
    }
    else if arrayOne.count == 0, arrayTwo.count == 0 {
        return true
    }
    
    if arrayOne[0] != arrayTwo[0] {
        return false
    }
    
    let leftOne = getSmaller(arrayOne)
    let leftTwo = getSmaller(arrayTwo)
    let rightOne = getBigger(arrayOne)
    let rightTwo = getBigger(arrayTwo)
    
    return sameBsts(leftOne, leftTwo) && sameBsts(rightOne, rightTwo)
}

func getSmaller(_ array: [Int]) -> [Int] {
    
    var smaller = [Int]()
    
    for i in 1 ..< array.count {
        if array[i] < array[0] {
            smaller.append(array[i])
        }
    }
    
    return smaller
}

func getBigger(_ array: [Int]) -> [Int] {
    var bigger = [Int]()
    
    for i in 1 ..< array.count {
        if array[i] >= array[0] {
            bigger.append(array[i])
        }
    }
    
    return bigger
}
