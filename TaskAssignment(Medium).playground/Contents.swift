import UIKit

// Solution-1:
// Time: O(nlogn) where n is the lenght of the tasks array
// Spacer: O(n)
func taskAssignment(_ k: Int, _ tasks: [Int]) -> [[Int]] {
    
    var result = [[Int]]()
    var varK = k
    
    let sortedTasks = tasks.sorted()
    var indicesOfSortedTasks = getIndicesOfSortedTasks(tasks)
    
    var leftPointer = 0
    var rightPointer = sortedTasks.count - 1
    
    while varK > 0 {
        
        let firstTask = sortedTasks[leftPointer]
        let secondTask = sortedTasks[rightPointer]
        
        result.append([indicesOfSortedTasks[firstTask]!.last!, indicesOfSortedTasks[secondTask]!.last!])
        indicesOfSortedTasks[firstTask]!.removeLast()
        indicesOfSortedTasks[secondTask]!.removeLast()
        
        leftPointer += 1
        rightPointer -= 1
        
        varK -= 1
    }
    
    
    return result
}

func getIndicesOfSortedTasks(_ tasks: [Int]) -> [Int: [Int]] {
    var indicesDict = [Int: [Int]]()
    
    for i in 0 ..< tasks.count {
        let task = tasks[i]
        if indicesDict[task] == nil {
            indicesDict[task] = [Int]()
        }
        
        indicesDict[task]!.append(i)
    }
    
    return indicesDict
}
