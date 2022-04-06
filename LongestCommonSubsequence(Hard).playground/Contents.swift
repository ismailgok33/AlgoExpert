import UIKit

// Solution-1:
// Time: O(nm x min(n, m)) where n and m are the lenght of the strings (since we are concetanating the lcs and the next char nm times)
// Space: O(nm x min(n, m))
func longestCommonSubsequence(firstString: String, secondString: String) -> [String] {
    var lcs = [[[String]]]()
    
    for _ in 0 ..< firstString.count + 1 {
        let row = Array(repeating: [String](), count: secondString.count + 1)
        lcs.append(row)
    }
    
    for i in 1 ..< firstString.count + 1 {
        for j in 1 ..< secondString.count + 1 {
            let firstIndex = firstString.index(firstString.startIndex, offsetBy: i - 1)
            let secondIndex = secondString.index(secondString.startIndex, offsetBy: j - 1)
            
            if firstString[firstIndex] == secondString[secondIndex] {
                var diagonal = lcs[i - 1][j - 1]
                let charAsString = String(firstString[firstIndex])
                diagonal.append(charAsString)
                
                lcs[i][j] = diagonal
            }
            else {
                let left = lcs[i][j - 1] // the left neighbor in the 2d matrix
                let top = lcs[i - 1][j] // the top neighbor in the 2d matrix
                
                lcs[i][j] = left.count > top.count ? left : top
            }
        }
    }
    
    return lcs[firstString.count][secondString.count]
}

// Solution-2:
// Time: O(nm x min(n, m)) where n and m are the lenght of the strings
// Space: O(min(n, m)^2) -> it only keeps the last 2 rows instead of all of the 2d array
//func longestCommonSubsequence2(firstString: String, secondString: String) -> [String] {
//    var lcs = [[[String]]]()
//
//
//
//    return lcs[firstString.count][secondString.count]
//}

// Solution-3: Better (Backtracking approach)
// Time: O(nm) where n and m are the lenght of the strings
// Space: O(nm)
func longestCommonSubsequence3(firstString: String, secondString: String) -> [String] {
    var lcs = [[(String, Int, Int, Int)]]()
    
    for _ in 0 ..< firstString.count + 1 {
        var row = [(String, Int, Int, Int)]()
        
        for _ in 0 ..< secondString.count + 1 {
            let tuple = ("", 0, 0, 0)
            row.append(tuple)
        }
        
        lcs.append(row)
    }
    
    for i in 1 ..< firstString.count + 1 {
        for j in 1 ..< secondString.count + 1 {
            let firstIndex = firstString.index(firstString.startIndex, offsetBy: i - 1)
            let secondIndex = secondString.index(secondString.startIndex, offsetBy: j - 1)
            
            if firstString[firstIndex] == secondString[secondIndex] {
                let charAsString = String(firstString[firstIndex])
                
                lcs[i][j] = (charAsString, lcs[i - 1][j - 1].1 + 1, i - 1, j - 1)
            }
            else {
                if lcs[i - 1][j].1 > lcs[i][j - 1].1 {
                    lcs[i][j] = ("", lcs[i - 1][j].1, i - 1, j) // the left neighbor in the 2d matrix
                }
                else {
                    lcs[i][j] = ("", lcs[i][j - 1].1, i, j - 1) // the top neighbor in the 2d matrix
                }
            }
            
        }
    }

    return buildSequence(lcs: lcs)
}

func buildSequence(lcs: [[(String, Int, Int, Int)]]) -> [String] {
    var sequence = [String]()
    
    var i = lcs.count - 1
    var j = lcs[0].count - 1
    
    while i != 0, j != 0 {
        let currentEntry = lcs[i][j]
        
        if currentEntry.0 != "" {
            sequence.insert(currentEntry.0, at: 0)
        }
        
        i = currentEntry.2
        j = currentEntry.3
    }
    
    return sequence
}


// Solution-4: Better than S1 and S2, same as S3 (Backtracking approach)
// Time: O(nm) where n and m are the lenght of the strings
// Space: O(nm)
func longestCommonSubsequence4(firstString: String, secondString: String) -> [String] {
    var lengths = [[Int]]()
    
    for _ in 0 ..< firstString.count + 1 {
        let row = [Int](repeating: 0, count: secondString.count + 1)
        lengths.append(row)
    }
    
    for i in 1 ..< firstString.count + 1 {
        for j in 1 ..< secondString.count + 1 {
            let firstIndex = firstString.index(firstString.startIndex, offsetBy: i - 1)
            let secondIndex = secondString.index(secondString.startIndex, offsetBy: j - 1)
            
            if firstString[firstIndex] == secondString[secondIndex] {
                lengths[i][j] = lengths[i - 1][j - 1] + 1
            }
            else {
                lengths[i][j] = max(lengths[i - 1][j], lengths[i][j - 1])
            }
        }
    }
    
    return buildSequence2(lengths: lengths, string: secondString)
}

// build lcs from lenghts array and initial string
func buildSequence2(lengths: [[Int]], string: String) -> [String] {
    var sequence = [String]()
    
    var i = lengths.count - 1
    var j = lengths[0].count - 1
    
    while i != 0, j != 0 {
        if lengths[i][j] == lengths[i - 1][j] {
            i -= 1
        }
        else if lengths[i][j] == lengths[i][j - 1] {
            j -= 1
        }
        else {
            let index = string.index(string.startIndex, offsetBy: j - 1)
            let charAsString = String(string[index])
            
            sequence.insert(charAsString, at: 0)
            i -= 1
            j -= 1
        }
    }
    
    return sequence
}
