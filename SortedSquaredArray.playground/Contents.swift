import UIKit

// Solution-1
// Time: O(NlogN) where N is the size of array. Sort algorithm is an O(NLogn) algorithm. Map is O(N)
// Space: O(N) where N is the size of array
func sortedSquaredArray(_ array: [Int]) -> [Int] {
    
    guard !array.isEmpty else { return [Int]() }
    var result = [Int]()
    
    result = array.map({
        $0 * $0
    })
    
    return result.sorted()
}

var array = [1, 2, 3, 5, 6, 8, 9]

print(sortedSquaredArray(array))

// Solution-2 (Better)
// Time: O(N) where n is the length of the array
// Space: O(N) where N is the size of array
func sortedSquaredArray2(_ array: [Int]) -> [Int] {
    
//    var result = [Int]()
//    result.reserveCapacity(array.count)
//
    guard !array.isEmpty else { return [Int]() }
    
    var result : [Int] = [Int](repeating: 0, count: array.count)
    
    var firstIndex = 0
    var lastIndex = array.count - 1
    var index = array.count - 1
    
    while firstIndex <= lastIndex {
        if compareElementSquares(first: array[firstIndex], second: array[lastIndex]) {
            result[index] = array[firstIndex] * array[firstIndex]
            firstIndex += 1
        }
        else {
            result[index] = array[lastIndex] * array[lastIndex]
            lastIndex -= 1
        }
        index -= 1
        print("result in while loop: \(result)")
    }
    
    return result
}

func compareElementSquares(first firstElement: Int, second secondElement: Int) -> Bool {
    if firstElement * firstElement >= secondElement * secondElement {
        return true
    }
    else {
        return false
    }
}

array = [-5, -2, 0, 3, 7]
print(sortedSquaredArray2(array))
