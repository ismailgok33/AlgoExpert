import UIKit

class Program {
    // Do not edit the class below except for the
    // populateSuffixTrieFrom and contains methods.
    // Feel free to add new properties and methods
    // to the class.
    class TrieNode {
        var children: [String: Any] = [:]
    }
    
    class SuffixTrie {
        var root = TrieNode()
        let endSymbol = "*"
        
        init(string: String) {
            populateSuffixTrieFrom(string: string)
        }
        
        // Solution-1:
        // Time: O(n^2) where n is the lenght of the string
        // Space: O(n^2)
        func populateSuffixTrieFrom(string: String) {
            for i in 0 ..< string.count {
                insertSubstringStartingAt(i, string, root)
            }
        }
        
        func insertSubstringStartingAt(_ index: Int, _ string: String, _ root: TrieNode) {
            var node = root
            
            for j in index ..< string.count {
                let jStringIndex = string.index(string.startIndex, offsetBy: j)
                let jthCharacter = String(string[jStringIndex])
                
//                let nextNode = node.children[jthCharacter, default: TrieNode()] as! TrieNode
                if !node.children.keys.contains(jthCharacter) {
                    node.children[jthCharacter] = TrieNode()
                }
                let nextNode = node.children[jthCharacter] as! TrieNode
                node = nextNode
            }
            
            node.children[endSymbol] = true
        }
        
        // Time: O(m) where m is the lenght of the searched substring
        // Space: O(1)
        func contains(string: String) -> Bool {
            var node = root
            
            for char in string {
                let stringifiedChar = String(char)
                
                if !node.children.keys.contains(stringifiedChar) {
                    return false
                }
                
                let nextNode = node.children[stringifiedChar] as! TrieNode
                node = nextNode
            }
            
            let isReachedToEnd = node.children[endSymbol] != nil
            
            return isReachedToEnd
        }
        
        
    }
}
