import UIKit

// Solution-1: Bucket Sort (naive approach - iterates array twice)
// Time: O(n) where n is the lenght of the array
// Space: O(1)
func threeNumberSort(_ array: inout [Int], _ order: [Int]) -> [Int] {
    
    var firstNumberCount = 0 // bucket-1
    var secondNumberCount = 0 // bucket-2
    var thirdNumberCount = 0 // bucket-3
   
    for elm in array {
        if elm == order[0] {
            firstNumberCount += 1
        }
        else if elm == order[1] {
            secondNumberCount += 1
        }
        else {
            thirdNumberCount += 1
        }
    }
    
    for i in 0 ..< array.count {
        if i < firstNumberCount {
            array[i] = order[0]
        }
        else if i < firstNumberCount + secondNumberCount {
            array[i] = order[1]
        }
        else {
            array[i] = order[2]
        }
    }
    
    return array
}

// Solution-2: Same (iterates array twice)
// Time: O(n) where n is the lenght of the array
// Space: O(1)
func threeNumberSort2(_ array: inout [Int], _ order: [Int]) -> [Int] {
    var firstIndex = 0
    let (firstValue, lastValue) = (order[0], order[2])
    
    for i in 0 ..< array.count {
        if array[i] == firstValue {
            (array[firstIndex], array[i]) = (array[i], array[firstIndex]) // swap same with array.swapAt
            firstIndex += 1
        }
    }
   
    var lastIndex = array.count - 1
    for i in stride(from: array.count - 1, through: 0, by: -1) {
        if array[i] == lastValue {
            (array[lastIndex], array[i]) = (array[i], array[lastIndex]) // swap same with array.swapAt
            lastIndex -= 1
        }
    }
    
    return array
}

// Solution-3: Better (iterates array once)
// Time: O(n) where n is the lenght of the array
// Space: O(1)
func threeNumberSort3(_ array: inout [Int], _ order: [Int]) -> [Int] {
  
    var (firstPointer, secondPointer, thirdPointer) = (0, 0, array.count - 1)
    
    let (firstValue, secondValue, thirdValue) = (order[0], order[1], order[2])
    
    while secondPointer <= thirdPointer {
        if array[secondPointer] == secondValue {
            secondPointer += 1
        }
        else if array[secondPointer] == firstValue {
            array.swapAt(firstPointer, secondPointer) // another way of swaping element in an array
            firstPointer += 1
            secondPointer += 1
        }
        else if array[secondPointer] == thirdValue {
            array.swapAt(secondPointer, thirdPointer) // another way of swaping element in an array
            thirdPointer -= 1
        }
    }
    
    
    return array
}
