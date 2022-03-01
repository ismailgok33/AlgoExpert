import UIKit

// Solution-1
// Time: O(n^2) where n is the lenght of the array
// Space: O(1)
func moveElementToEnd(_ array: inout [Int], _ toMove: Int) -> [Int] {
    
    for i in 0 ..< array.count {
        for j in stride(from: array.count - 1, to: i, by: -1) {
            if array[i] != toMove {
                break
            }
            
            if array[i] == toMove && array[j] != toMove {
                array.swapAt(i, j)
                break
            }
        }
    }

    return array
}

var array = [2, 1, 2, 2, 2, 3, 4, 2]
var toMove = 2

//print(moveElementToEnd(&array, toMove))


// Solution-2
// Time: O(n) where n is the lenght of the array
// Space: O(1)
func moveElementToEnd2(_ array: inout [Int], _ toMove: Int) -> [Int] {
    
    var leftPointer = 0
    var rightPointer = array.count - 1
        
    while leftPointer < rightPointer {
        if array[leftPointer] != toMove {
            leftPointer += 1
        }
        
        if array[rightPointer] == toMove {
            rightPointer -= 1
        }
        
        if array[leftPointer] == toMove && array[rightPointer] != toMove {
            array.swapAt(leftPointer, rightPointer)
            leftPointer += 1
            rightPointer -= 1
        }
    }

    return array
}

print(moveElementToEnd2(&array, toMove))
