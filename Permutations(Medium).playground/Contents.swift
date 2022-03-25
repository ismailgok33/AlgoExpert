import UIKit

// Solution-1
// Time: upper bound: O(n^2 * n!) - roughly O(n * n!) where n is the lenght of the array
// Space: O(n * n!)
func permutations(array: inout [Int]) -> [[Int]] {
    var permutations = [[Int]]()
    permutationHelper(array: array, currentPermutation: [], permutations: &permutations)
    return permutations
}

func permutationHelper(array: [Int], currentPermutation: [Int], permutations: inout [[Int]]) {
    if array.isEmpty, !currentPermutation.isEmpty {
        permutations.append(currentPermutation)
    }
    else {
        for i in 0 ..< array.count {
            let newArray = Array(array.prefix(upTo: i) + array.suffix(from: i + 1))
            let newPermutation = currentPermutation + [array[i]]
            permutationHelper(array: newArray, currentPermutation: newPermutation, permutations: &permutations)
            
        }
    }
}


// Solution-1: Slightly better on worst case
// Time: O(n * n!)
// Space: O(n * n!)
func permutations2(array: inout [Int]) -> [[Int]] {
    var permutations = [[Int]]()
    permutationHelper2(i: 0, array: &array, permutations: &permutations)
    return permutations
}

func permutationHelper2(i: Int, array: inout [Int], permutations: inout [[Int]]) {
    if i == array.count - 1 {
        permutations.append(array)
    }
    else {
        for j in i ..< array.count {
            swap(array: &array, i: i, j: j)
            permutationHelper2(i: i + 1, array: &array, permutations: &permutations)
            swap(array: &array, i: i, j: j)
        }
    }
}

func swap(array: inout [Int], i: Int, j: Int) {
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}
