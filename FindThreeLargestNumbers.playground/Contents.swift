import UIKit

// Solution-1
// Time: O(n) where n is the length of the array
// Space: O(n)
func findThreeLargestNumbers(array: [Int]) -> [Int] {
    
    var largest: Int = Int.min
    var largestIndex = -1
    var copyArray = array
    var results: [Int] = [Int.min, Int.min, Int.min]
    
    for j in stride(from: 2, through: 0, by: -1) {
        var repetation = copyArray.count
        for i in 0..<repetation {
            if copyArray[i] > largest {
                largest = copyArray[i]
                largestIndex = i
            }
        }
        copyArray.remove(at: largestIndex)
        results[j] = largest
        largest = Int.min
    }
    
    return results
}

var array = [141, 1, 17, -7, -17, -27, 18, 541, 8, 7, 7]

//print(findThreeLargestNumbers(array: array))

// Solution-2 - Slightly better
// Time: O(n) where n is the length of the array
// Space: O(1)
func findThreeLargestNumbers2(array: [Int]) -> [Int] {
    
    var results: [Int] = [Int.min, Int.min, Int.min]
    
    for elm in array {
        if elm > results[0] {
            results[0] = elm
        }
        else if elm > results[1] {
            results[1] = elm
        }
        else if elm > results[2] {
            results[2] = elm
        }
        compareResults(results: &results)
    }
    
    return results
}

func compareResults(results: inout [Int]) {
    var temp = 0
    if results[0] > results [1] {
        temp = results[1]
        results[1] = results[0]
        results[0] = temp
    }
    
    if results[0] > results [2] {
        temp = results[2]
        results[2] = results[0]
        results[0] = temp
    }
    
    if results[1] > results [2] {
        temp = results[2]
        results[2] = results[1]
        results[1] = temp
    }
}

print(findThreeLargestNumbers2(array: array))
