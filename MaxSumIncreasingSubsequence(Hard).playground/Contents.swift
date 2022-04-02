import UIKit

// Solution-1: Typical Dynamic Programming Solution
// Time: O(n^2) where n is the lenght of the array
// Space: O(n)
func maximumSumIncreasingSubsequence(array: [Int]) -> (Int, [Int]) {
    
    var maxSumIndex = 0
    var sums = array.map({ $0 }) // copy the array
    var previousIndices: [Int?] = Array(repeating: nil, count: array.count) // to store the previous number that we added to the sums array i = j
    
    for i in 0 ..< array.count {
        let currentNumber = array[i]
        
        for j in 0 ..< i {
            let previousNumber = array[j]
            
            if previousNumber < currentNumber, sums[j] + currentNumber > sums[i] {
                sums[i] = sums[j] + currentNumber
                previousIndices[i] = j
            }
        }
        
        if sums[i] > sums[maxSumIndex] {
            maxSumIndex = i
        }
    }
    
    return (sums[maxSumIndex], buildSequence(array, maxSumIndex, previousIndices: previousIndices))
}

func buildSequence(_ array: [Int], _ maxSumIndex: Int, previousIndices: [Int?]) -> [Int] {
    // We get rid of nils and append the non-nil indices to the sequence.
    // We check the indices on the sums array and find our increasing subsequence
    // and look for their indices in the previousIndices array and return them as new array.
    var sequence = [Int]()
    var currentIndex: Int? = maxSumIndex
    
    while currentIndex != nil {
        sequence.insert(array[currentIndex!], at: 0)
        currentIndex = previousIndices[currentIndex!]
    }
    
    
    return sequence
}
