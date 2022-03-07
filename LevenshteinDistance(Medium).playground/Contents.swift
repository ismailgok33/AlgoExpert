import UIKit

// Solution-1
// Time: O(m x n) where m and n are the lenghts of firstString and secondString
// Space: O(m x n) since we are creating a two-dimentional array
func levenshteinDistance(firstString: String, secondString: String) -> Int {
    
    var edits = [[Int]]()
    
    for i in 0 ..< firstString.count + 1 {
        var row = [Int]()
        
        for j in 0 ..< secondString.count + 1 {
            row.append(j)
        }
        row[0] = i
        edits.append(row)
    }
    
    for i in 1 ..< firstString.count + 1 {
        for j in 1 ..< secondString.count + 1 {
            let firstIndex = firstString.index(firstString.startIndex, offsetBy: i - 1)
            let secondIndex = secondString.index(secondString.startIndex, offsetBy: j - 1)
            
            if firstString[firstIndex] == secondString[secondIndex] {
                edits[i][j] = edits[i - 1][j - 1]
            }
            else {
                edits[i][j] = 1 + min(edits[i - 1][j - 1], edits[i][j - 1], edits[i - 1][j])
            }
        }
    }
    
    return edits[firstString.count][secondString.count]
}

// Solution-2
// Time: O(m x n) where m and n are the lenghts of firstString and secondString
// Space: O(min(m, n)) since we are using the small sized string and create an array for it
func levenshteinDistance2(firstString: String, secondString: String) -> Int {
    
    let small = firstString.count < secondString.count ? firstString : secondString
    let big = firstString.count >= secondString.count ? firstString : secondString
    
    var evenEdits = [Int]()
    var oddEdits = [Int](repeating: 0, count: small.count + 1)
    
    for i in 0 ..< small.count + 1 {
        evenEdits.append(i)
    }
    
    for i in 1 ..< big.count + 1 {
        if i % 2 == 1 {
            optimizedLevenshteinDistanceHelper(bigIndex: i, smallString: small, bigString: big, currentEdits: &oddEdits, previousEdits: &evenEdits)
        }
        else {
            optimizedLevenshteinDistanceHelper(bigIndex: i, smallString: small, bigString: big, currentEdits: &evenEdits, previousEdits: &oddEdits)
        }
    }
    
    return big.count % 2 == 0 ? evenEdits[small.count] : oddEdits[small.count]
}

func optimizedLevenshteinDistanceHelper(bigIndex: Int, smallString: String, bigString: String, currentEdits: inout [Int], previousEdits: inout [Int]) {
    currentEdits[0] = bigIndex
    
    for j in 1 ..< smallString.count + 1 {
        let firstIndex = bigString.index(bigString.startIndex, offsetBy: bigIndex - 1)
        let secondIndex = smallString.index(smallString.startIndex, offsetBy: j - 1)
        
        if bigString[firstIndex] == smallString[secondIndex] {
            currentEdits[j] = previousEdits[j - 1]
        }
        else {
            currentEdits[j] = 1 + min(previousEdits[j], previousEdits[j - 1], currentEdits[j - 1])
        }
    }
}
