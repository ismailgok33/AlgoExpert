import UIKit

// Solution-1:
// Time: O(1) since there can be max 2^32 ip addresses (32 bit) so it is constant, doesn't depend on length of the input or output array
// 32 bit = 0, 255 -> 256 possible ip address for one section. -> 256 x 256 x 256 x 256 (for 4 sections) = 2^32
// Space: O(n) where n is the lenght of the output string
func validIPAddresses(_ string: String) -> [String] {
    let indexedString = Array(string)
    var ipAddressesFound = [String]()
    
    for i in 1 ..< min(string.count, 4) {
        var currentIpAddresses: [[Character]] = [[], [], [], []]
        
        currentIpAddresses[0] = Array(indexedString[..<i])
        if !isValidPart(currentIpAddresses[0]) {
            continue
        }
        
        for j in i + 1 ..< i + min(string.count - i, 4) {
            currentIpAddresses[1] = Array(indexedString[i..<j])
            if !isValidPart(currentIpAddresses[1]) {
                continue
            }
            
            for k in j + 1 ..< j + min(string.count - j, 4) {
                currentIpAddresses[2] = Array(indexedString[j..<k])
                currentIpAddresses[3] = Array(indexedString[k...])
                if isValidPart(currentIpAddresses[2]), isValidPart(currentIpAddresses[3]) {
                    ipAddressesFound.append(joinIP(currentIpAddresses))
                }
            }
        }
    }
    
    
    return ipAddressesFound
}

func isValidPart(_ string: [Character]) -> Bool {
    let i = Int(String(string)) ?? 256
    if i > 255 {
        return false
    }
    return String(i).count == string.count
}

func joinIP(_ ip: [[Character]]) -> String {
    var segments = [String]()
    
    for segment in ip {
        segments.append(String(segment))
    }
    return segments.joined(separator: ".")
}
