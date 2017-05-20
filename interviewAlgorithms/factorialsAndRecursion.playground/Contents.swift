

import UIKit



//func factorialOfValue(value: UInt) -> UInt {
//    var product: UInt = 1
//    
//    for i in 1...value {
//        product = product * i
//    }
//    
//    return product
//}



func recursiveFactorialOfValue(value: UInt) -> UInt {
    if value == 0 {
        return 1
    }
    
    return value * recursiveFactorialOfValue(value: value - 1)
    
}


recursiveFactorialOfValue(value: 4)



func factorial(value: UInt) -> UInt {
    var product: UInt = 1
    
    for i in 1...value {
        product = product * i
    }
    
    return product
}


print(factorial(value:4))



