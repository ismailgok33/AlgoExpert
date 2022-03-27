import UIKit

// Solution-1
// Time: O(w x nlogn) where w is the lenght of the words array and n is the length of the longest string in that array
// Since we are iterating the w lenght array and for every element we sort that string which best takes nlogn time
// Space: O(w x n) - since we are iterating w length words array and the longest element has n length string.
func groupAnagrams(_ words: [String]) -> [[String]] {
    
    var anagrams = [String : [String]]() // sorted word is key, and anagrams of that word are values as array
    var result = [[String]]()
    
    for word in words {
        let sortedWord = String(word.sorted())
        if var anagramValues = anagrams[sortedWord] { // if the sorted state of the word is already added to the anagrams dict
            anagramValues.append(word) // add the word to the anagram value string array
            anagrams[sortedWord] = anagramValues // re set the appended values array to the anagram dict key
        }
        else { // if there are no anagram for that word in the dict yet
            anagrams[sortedWord] = [word]
        }
    }
    
    for anagramValues in anagrams.values {
        result.append(anagramValues)
    }
    
    return result
}
