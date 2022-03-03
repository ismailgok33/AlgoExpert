import UIKit

// Solution-1
// Time: O(nlogn) where n is the length of the intervals array since we sorted the array
// Space: O(n)
func mergeOverlappingIntervals(_ intervals: [[Int]]) -> [[Int]] {
    
    var results: [[Int]?] = intervals.sorted(by: { $0[0] < $1[0] })
    
    for i in 0 ..< results.count - 1 {
        guard let firstInterval = results[i], let secondInterval = results[i + 1] else { return [[Int]]() }
        if firstInterval[1] >= secondInterval[0] {
            results[i + 1] = [firstInterval[0], max(secondInterval[1], firstInterval[1])]
            results[i] = nil
        }
    }
    
    return results.compactMap({ $0 })
}

var intervals = [
    [1, 2],
    [3, 5],
    [4, 7],
    [6, 8],
    [9, 10]
  ]

print(mergeOverlappingIntervals(intervals))

// Solution-2 - Slightly Better
// Time: O(nlogn) where n is the length of the intervals array since we sorted the array
// Space: O(n)
func mergeOverlappingIntervals2(_ intervals: [[Int]]) -> [[Int]] {
    
    let sortedIntervals = intervals.sorted(by: { $0[0] < $1[0] })
    var results = [sortedIntervals[0]]
    
    for i in 1 ..< sortedIntervals.count {
        if results[results.count - 1][1] >= sortedIntervals[i][0] {
            results[results.count - 1][1] = max(results[results.count - 1][1], sortedIntervals[i][1])
        }
        else {
            results.append(sortedIntervals[i])
        }
    }
    
    return results
}

print(mergeOverlappingIntervals2(intervals))
