import UIKit

var input = [3, 5, -4, 8, 11, 1, -1, 6]
var target = 10

// First answer
func twoNumberSum(_ array: inout[Int], _ targetSum: Int) -> [Int] {
    var numbersHashMap = [Int: Bool]()
    
    for number in array {
        let potentialMatch = targetSum - number
        
        if let exists = numbersHashMap[potentialMatch], exists {
            return [potentialMatch, number]
        }
        else {
            numbersHashMap[number] = true
        }
    }
    
    return []
}

// Second answer
func twoNumberSum2(_ array: inout [Int], _ targetSum: Int) -> [Int] {
      var dictionary: [Int:Int] = [:]
        
        // Substract every element from targetSum and add them to dictionary
        for elm in array {
            let subt = targetSum - elm
            
            if let val = dictionary[elm], val == subt {
                return [elm, subt]
            }
            else {
                dictionary[subt] = elm
            }
        }
        
        return []
  }

print(twoNumberSum(&input, target))
print(twoNumberSum2(&input, target))

input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 15]
target = 18

print(twoNumberSum(&input, target))
print(twoNumberSum2(&input, target))




