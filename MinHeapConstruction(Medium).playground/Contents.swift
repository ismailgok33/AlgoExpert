class Program {
    class MinHeap {
        var heap = [Int]()
        
        init(array: [Int]) {
            var array = array
            heap = buildHeap(array: &array)
        }
        
        // Time: O(n) where n is the length of the array
        // Space: O(1)
        func buildHeap(array: inout [Int]) -> [Int] {
            let lastParentIndex = Int((array.count - 1 - 1) / 2)
            
            for var i in (0 ... lastParentIndex).reversed() {
                var endIndex = array.count - 1
                siftDown(currentIndex: &i, endIndex: &endIndex, heap: &array)
            }
            
            return array
        }
        
        // Time: O(logn) where n is the length of the array
        // Space: O(1)
        func siftDown(currentIndex: inout Int, endIndex: inout Int, heap: inout [Int]) {
            var childOneIndex = currentIndex * 2 + 1
            var smallerChildIndex = childOneIndex
            
            while childOneIndex <= endIndex {
                var childTwoIndex = -1
                if childOneIndex <= endIndex - 1 { // if the node has two children
                    childTwoIndex = childOneIndex + 1
                    
                    smallerChildIndex = heap[childOneIndex] < heap[childTwoIndex] ? childOneIndex : childTwoIndex // set the smallerChildIndex
                }
                
                if heap[smallerChildIndex] < heap[currentIndex] {
                    heap.swapAt(smallerChildIndex, currentIndex)
                    currentIndex = smallerChildIndex
                    childOneIndex = currentIndex * 2 + 1
                }
                else {
                    break
                }
            }
        }
        
        // Time: O(logn) where n is the length of the array
        // Space: O(1)
        func siftUp(currentIndex: inout Int, heap: inout [Int]) {
            var parentIndex = Int((currentIndex - 1) / 2)
            
            while parentIndex >= 0, heap[parentIndex] > heap[currentIndex] {
                heap.swapAt(currentIndex, parentIndex)
                currentIndex = parentIndex
                parentIndex = Int((currentIndex - 1) / 2)
            }
        }
        
        // Time: O(1)
        // Space: O(1)
        func peek() -> Int {
            return heap[0]
        }
        
        // Time: O(logn) where n is the length of the array
        // Space: O(1)
        func remove() -> Int {
            var firstIndex = 0
            var lastIndex = heap.count - 1
            heap.swapAt(firstIndex, lastIndex)
            let valueToRemove = heap.popLast()!
            lastIndex = heap.count - 1
            siftDown(currentIndex: &firstIndex, endIndex: &lastIndex, heap: &heap)
            return valueToRemove
        }
        
        // Time: O(1)
        // Space: O(1)
        func insert(value: Int) {
            heap.append(value)
            var lastIndex = heap.count - 1
            siftUp(currentIndex: &lastIndex, heap: &heap)
        }
    }
}

