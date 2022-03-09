import UIKit

class Program {
    // This is an input class. Do not edit.
    class AncestralTree {
        var name = String()
        var ancestor: AncestralTree?
        
        init(name: String) {
            self.name = name
            ancestor = nil
        }
    }
    
    // Solution-1
    // Time: O(d) where d is the depth of the lowest descendent
    // Space: O(1)
//    func getYoungestCommonAncestor(_ topAncestor: AncestralTree?, _ descendantOne: inout AncestralTree?, _ descendantTwo: inout AncestralTree?) -> AncestralTree {
//
//        var firstDescendent = descendantOne
//        var secondDescendent = descendantTwo
//        var difference = 0
//
//        let depthOne = getDepth(descendent: &firstDescendent, topAncestor: topAncestor)
//        let depthTwo = getDepth(descendent: &secondDescendent, topAncestor: topAncestor)
//
//        if depthOne > depthOne {
//            difference = depthOne - depthTwo
//            return backTrackAncestralTree(lowerDescendent: &firstDescendent, higherDescendent: &secondDescendent, difference: &difference)
//        }
//        else {
//            difference = depthTwo - depthOne
//            return backTrackAncestralTree(lowerDescendent: &secondDescendent, higherDescendent: &firstDescendent, difference: &difference)
//        }
//    }
//
//    func getDepth(descendent: inout AncestralTree?, topAncestor: AncestralTree?) -> Int {
//        var depth = 0
//
//        while descendent !== topAncestor {
//            depth += 1
//            descendent = descendent?.ancestor
//        }
//
//        return depth
//    }
//
//    func backTrackAncestralTree(lowerDescendent: inout AncestralTree?, higherDescendent: inout AncestralTree?, difference: inout Int) -> AncestralTree {
//
//        while difference > 0 {
//            difference -= 1
//            lowerDescendent = lowerDescendent?.ancestor
//        }
//
//        while lowerDescendent !== higherDescendent {
//            lowerDescendent = lowerDescendent?.ancestor
//            higherDescendent = higherDescendent?.ancestor
//        }
//
//        return lowerDescendent!
//    }
    
    // Solution-1
    // Time: O(d) where d is the depth of the lowest descendent
    // Space: O(1)
    func getYoungestCommonAncestor(_ topAncestor: AncestralTree?, _ descendantOne: inout AncestralTree?, _ descendantTwo: inout AncestralTree?) -> AncestralTree {
        var firstDescendant = descendantOne
        var secondDescendat = descendantTwo
        
        let depthOne = getDescendantDepth(&descendantOne, topAncestor)
        let depthTwo = getDescendantDepth(&descendantTwo, topAncestor)
        
        if depthOne > depthTwo {
            var difference = depthOne - depthTwo
            return backTrackAncestralTree(&firstDescendant, higherDescendent: &secondDescendat, &difference)
        }
        else {
            var difference = depthTwo - depthOne
            return backTrackAncestralTree(&secondDescendat, higherDescendent: &firstDescendant, &difference)
        }
    }
    
    func getDescendantDepth(_ descendant: inout AncestralTree?, _ topAncestor: AncestralTree?) -> Int {
        var depth = 0
        
        while descendant !== topAncestor {
            depth += 1
            descendant = descendant?.ancestor
        }
        
        return depth
    }
    
    func backTrackAncestralTree(_ lowerDescendent: inout AncestralTree?, higherDescendent: inout AncestralTree?, _ difference: inout Int) -> AncestralTree {
        while difference > 0 {
            difference -= 1
            lowerDescendent = lowerDescendent?.ancestor
        }
        
        while lowerDescendent !== higherDescendent {
            lowerDescendent = lowerDescendent?.ancestor
            higherDescendent = higherDescendent?.ancestor
        }
        
        return lowerDescendent!
    }
    
    
}
