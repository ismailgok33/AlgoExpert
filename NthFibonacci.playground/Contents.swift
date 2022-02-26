import UIKit

// Solution-1
// Time: O(2^n) where n is the parameter
// Space: O(n)
func getNthFib(n: Int) -> Int {
    
    // base cases
    if n == 1 {
        return 0
    }
    
    if n == 2 {
        return 1
    }
    
    return getNthFib(n: n-2) + getNthFib(n: n-1)
}

print(getNthFib(n: 2))
print(getNthFib(n: 6))


// Solution-2
// Time: O(n) where n is the parameter
// Space: O(n)
func getNthFib2(n: Int) -> Int {
    var cache = [1: 0, 2: 1] // memoization
    
    if cache[n] == nil {
        cache[n] = getNthFib(n: n-1) + getNthFib(n: n-2)
    }
    
    return cache[n]!
}

// Solution-3
// Time: O(N)
// Space: O(N)
func getNthFib3(n: Int) -> Int {
    
    var results = [0, 1]
    var i = 3
    
    if n == 1 {
        return 0
    }
    
    if n == 2 {
        return 1
    }
    
    while i <= n {
        results.append(results[i-3] + results[i-2])
        i += 1
    }
    
    return results[n-1]
}

print(getNthFib3(n: 2))
print(getNthFib3(n: 6))

// Solution-4 // Best solution
// Time: O(n) where n is the parameter
// Space: O(1)
func getNthFib4(n: Int) -> Int {
    
    if n == 1 {
        return 0
    }
    
    if n == 2 {
        return 1
    }
    
    var lastTwoValue = [0, 1]
    var i = 3
    var sum = 0
    
    while i <= n {
        sum = lastTwoValue[0] + lastTwoValue[1]
        lastTwoValue[0] = lastTwoValue[1]
        lastTwoValue[1] = sum
        i += 1
    }
    
    return lastTwoValue[1]
}

print(getNthFib4(n: 2))
print(getNthFib4(n: 6))
