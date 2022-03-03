import UIKit

// Solution-1
// Time: O(n) where n is the length of the array
// Space: O(n)
func arrayOfProducts(_ array: [Int]) -> [Int] {
    var totalProduct = 1
    var results = [Int]()
    var zeroCount = 0
    
    for elm in array {
        if elm == 0 {
            zeroCount += 1
        }
        else {
            totalProduct = totalProduct * elm
        }
    }
    
    for elm in array {
        if zeroCount == 1 {
            if elm == 0 {
                results.append(totalProduct)
            }
            else {
                results.append(0)
            }
        }
        else if zeroCount > 1 {
            results.append(0)
        }
        else {
            results.append((totalProduct / elm))
        }
    }
    
    return results
}

var array = [-5, 2, -4, 14, -6]
print(arrayOfProducts(array))

// Solution-2 - Shorter
// Time: O(n) where n is the length of the array
// Space: O(n)
func arrayOfProducts2(_ array: [Int]) -> [Int] {
    var product = 1
    var results = [Int]()
    var leftProducts = [Int](repeating: 1, count: array.count)
    var rightProducts = [Int](repeating: 1, count: array.count)
    
    for i in 1 ..< array.count {
        product = product * array[i - 1]
        leftProducts[i] = product
    }
    
    product = 1
    
    for i in stride(from: array.count - 2, through: 0, by: -1) {
        product = product * array[i + 1]
        rightProducts[i] = product
    }
    
    for i in 0 ..< array.count {
        results.append(leftProducts[i] * rightProducts[i])
    }
    
    return results
}

print(arrayOfProducts2(array))

// Solution-3 - Best
// Time: O(n) where n is the length of the array
// Space: O(n)
func arrayOfProducts3(_ array: [Int]) -> [Int] {
    var product = 1
    var results = [Int](repeating: 1, count: array.count)
    
    for i in 1 ..< array.count {
        product = product * array[i - 1]
        results[i] = product * results[i]
    }
    
    product = 1
    
    for i in stride(from: array.count - 2, through: 0, by: -1) {
        product = product * array[i + 1]
        results[i] = product * results[i]
    }
    
    return results
}

print(arrayOfProducts3(array))
