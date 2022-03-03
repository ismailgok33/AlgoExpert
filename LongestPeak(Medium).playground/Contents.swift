import UIKit

func longestPeak(array: [Int]) -> Int {
    
    guard array.count >= 3 else { return 0 }

    var currentPeak = 0
    var longestPeak = 0
    
    var i = 1
    while i < array.count - 1 {
        if array[i] > array[i - 1], array[i] > array[i + 1] {
            // found a pick
            currentPeak = 3
            var leftPointer = i - 2
            var rightPointer = i + 2
            
            while leftPointer >= 0 {
                if array[leftPointer] < array[leftPointer + 1] {
                    leftPointer -= 1
                }
                else {
                    break
                }
            }
            
            while rightPointer < array.count {
                if array[rightPointer] < array[rightPointer - 1] {
                    rightPointer += 1
                }
                else {
                    break
                }
            }
            
            currentPeak = rightPointer - leftPointer - 1
            
            if currentPeak > longestPeak {
                longestPeak = currentPeak
            }
            
            i = rightPointer
        }
        else {
            currentPeak = 0
            i += 1
        }
    }
    
    return longestPeak
}

var array = [1, 2, 3, 3, 4, 0, 10, 6, 5, -1, -3, 2, 3]
print(longestPeak(array: array))
