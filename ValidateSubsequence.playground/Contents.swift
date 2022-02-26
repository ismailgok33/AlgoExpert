import UIKit

// First answer
// Time: O(M x N) where M and N is the size of arrays
// Space: O(N) where N is the size of 'array'
func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {

    guard !array.isEmpty, !sequence.isEmpty else { return false }
    var copyArray = array
    var found = 0
    
    for i in 0 ..< sequence.count {
        for j in 0 ..< copyArray.count {
            if sequence[i] == copyArray[j] {
                copyArray.removeFirst(j + 1)
                found += 1
                break
            }
        }
    }
    
    if found == sequence.count {
        return true
    }
    
    return false
}

var array = [5, 1, 22, 25, 6, -1, 8, 10]
var sequence = [1, 6, -1, 10]

print(isValidSubsequence(array, sequence))

array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [1, 6, 8]

print(isValidSubsequence(array, sequence))

// Second answer (better)
// Time: O(n) where n is the number of element in the larger array
// Space: O(1)
func isValidSubsequence2(_ array: [Int], _ sequence: [Int]) -> Bool {

    guard !array.isEmpty, !sequence.isEmpty else { return false }
   
    var arrayPointer = 0
    var sequencePointer = 0
    
    while arrayPointer < array.count, sequencePointer < sequence.count {
        if array[arrayPointer] == sequence[sequencePointer] {
            sequencePointer += 1
        }
        arrayPointer += 1
    }
    
    if sequencePointer == sequence.count {
        return true
    }
    
    return false
}

array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [1, 6, -1, 10]

print(isValidSubsequence2(array, sequence))

array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [1, 6, 8]

print(isValidSubsequence2(array, sequence))

// Third answer (same as second)
// Time: O(n) where n is the number of element in the larger array
// Space: O(1)
func isValidSubsequence3(_ array: [Int], _ sequence: [Int]) -> Bool {

    guard !array.isEmpty, !sequence.isEmpty else { return false }
   
    var sequencePointer = 0
    
    for i in 0 ..< array.count {
        if sequencePointer == sequence.count {
            break
        }
        
        if array[i] == sequence[sequencePointer] {
            sequencePointer += 1
        }
    }
    
    return sequencePointer == sequence.count
}

array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [1, 6, -1, 10]

print(isValidSubsequence3(array, sequence))

array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [1, 6, 8]

print(isValidSubsequence3(array, sequence))
