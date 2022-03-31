import UIKit

// Solution-1: Naive approach
// Time: O(n^2) where n is the lenght of the scores array
// Space: O(n)
func minRewards(_ scores: [Int]) -> Int {
    
    var rewards = [Int](repeating: 1, count: scores.count)
    
    for i in 1 ..< scores.count {
        var j = i - 1
        
        if scores[i] > scores[j] {
            rewards[i] = rewards[j] + 1
        }
        else {
            while j >= 0, scores[j] > scores[j + 1] {
                rewards[j] = max(rewards[j], rewards[j + 1] + 1)
                j -= 1
            }
        }
    }
    
    return rewards.reduce(0) { $0 + $1 }
}

// Solution-2: Better (Local Mins and Local maxs approach)
// Time: O(n) where n is the lenght of the scores array
// Space: O(n)
func minRewards2(_ scores: [Int]) -> Int {
    
    var rewards = [Int](repeating: 1, count: scores.count)
   
    let localMinIndices = findLocalMinIndices(scores)
    
    for localMinIndex in localMinIndices {
        expandFromLocalMinIndex(localMinIndex, scores, &rewards)
    }
    
    return rewards.reduce(0) { $0 + $1 }
}

func findLocalMinIndices(_ scores: [Int]) -> [Int] {
    
    if scores.count == 1 {
        return [0]
    }
    
    var localMinIndices = [Int]()
    
    for i in 0 ..< scores.count {
        if i == 0 { // if the current elm is the first elm
            if scores[i] < scores[i + 1] {
                localMinIndices.append(i)
            }
        }
        else if i == scores.count - 1 { // if the current elm is the last elm
            if scores[i] < scores[i - 1] {
                localMinIndices.append(i)
            }
        }
        else {
            if scores[i] < scores[i - 1], scores[i] < scores[i + 1] {
                localMinIndices.append(i)
            }
        }
    }
    
    return localMinIndices
}

func expandFromLocalMinIndex(_ localMinIndex: Int, _ scores: [Int], _ rewards: inout [Int]) {
    
    var leftIndex = localMinIndex - 1
    while leftIndex >= 0, scores[leftIndex] > scores[leftIndex + 1] {
        rewards[leftIndex] = max(rewards[leftIndex], rewards[leftIndex + 1] + 1) // if another local min already increment the reward, get max
        leftIndex -= 1
    }
    
    var rightIndex = localMinIndex + 1
    while rightIndex < scores.count, scores[rightIndex] > scores[rightIndex - 1] {
        rewards[rightIndex] = rewards[rightIndex - 1] + 1 // there is no way another local min already incremented the reward.
        rightIndex += 1
    }
}

// Solution-3: Same with 2. (Cleaner)
// Time: O(n) where n is the lenght of the scores array
// Space: O(n)
func minRewards3(_ scores: [Int]) -> Int {
    
    var rewards = [Int](repeating: 1, count: scores.count)
    
    for i in 1 ..< scores.count {
        if scores[i] > scores[i - 1] {
            rewards[i] = rewards[i - 1] + 1
        }
    }
    
    for i in stride(from: scores.count - 2, through: 0, by: -1) {
        if scores[i] > scores[i + 1] {
            rewards[i] = max(rewards[i], rewards[i + 1] + 1)
        }
    }
    
    return rewards.reduce(0) { $0 + $1 }
}
