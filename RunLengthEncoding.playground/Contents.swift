import UIKit

// Solution-1
// Time: O(n) where n is the length of the string
// Space: O(n)
func runLengthEncoding(_ string: String) -> String {
    
    var result = ""
    let chars: [Character] = Array(string)
    var repetationCount = 1
    
    for i in 1 ..< chars.count {
        if chars[i] != chars[i-1] || repetationCount == 9 {
            result.append(String(repetationCount))
            result.append(String(chars[i-1]))
            repetationCount = 0
        }
        repetationCount += 1
    }
    
    // handle last run of the string
    result.append(String(repetationCount))
    result.append(String(string.last!))
    
    return result
}

var string = "AAAAAAAAAAAAABBCCCCDD"
print(runLengthEncoding(string))
