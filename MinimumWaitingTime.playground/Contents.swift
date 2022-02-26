import UIKit


    
// Solution-1
// Time: O(nlogn) where n is the lenght of the queries array
// Space: O(1)
func minimumWaitingTime(_ queries: inout [Int]) -> Int {
    
    var result = 0
    var prevResult = 0
    queries.sort()
    
    for i in 0..<queries.count-1 {
        prevResult += queries[i]
        result += prevResult
    }
    
    return result
}

var queries = [3, 2, 1, 2, 6]  // 1, 2, 2, 3, 6 = 1 + 3 + 5 + 8 = 17

print(minimumWaitingTime(&queries))


// 3 + (3+2) + (3+2+1) + (3+2+1+2) + (3+2+1+2+6)
// 3 + 5 + 6 + 8 + 14
