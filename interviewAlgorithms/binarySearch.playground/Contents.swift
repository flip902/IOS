import UIKit

//let numbers = [1, 2, 4, 6, 8, 9, 11, 13, 16, 17, 20]
//
//func binarySearch(searchValue: Int, array: [Int]) -> Bool {
//    
//    var leftIndex = 0
//    var rightIndex = array.count - 1
//    
//    while leftIndex <= rightIndex {
//        
//        let middleIndex = (leftIndex + rightIndex) / 2
//        let middleValue = array[middleIndex]
//        
//        print("middleValue: \(middleValue), leftIndex: \(leftIndex), rightIndex: \(rightIndex), [\(array[leftIndex]), \(array[rightIndex])]")
//        
//        if middleValue == searchValue {
//            return true
//        }
//        
//        if searchValue < middleValue {
//            rightIndex = middleIndex - 1
//        }
//        
//        if searchValue > middleValue {
//            leftIndex = middleIndex + 1
//        }
//    }
//    
//    return false
//    
//    
//}
//
//print(binarySearch(searchValue: 1, array: numbers))



let numbers = [1, 2, 4, 6, 7, 9, 11, 12, 14, 17, 18, 19, 20]

func binarySearch(searchvalue: Int, array: [Int]) -> Bool {
    
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = array[middleIndex]
        
        if middleValue == searchvalue {
            return true
        }
        
        if searchvalue < middleValue {
            rightIndex = middleIndex - 1
        }
        
        if searchvalue > middleValue {
            leftIndex = middleIndex + 1
        }
        
    }
    return false
}

print(binarySearch(searchvalue: 4, array: numbers))

















