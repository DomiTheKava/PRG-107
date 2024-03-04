import UIKit

var fibonocci_numbers: [Int] = []

func fibonocci() {
    var previous = 1
    var evenMorePrevious = 0
    var saver = 0
    
    // hopefully this is correct usage of a closure (in my eyes a temperary function)
    var maths: (inout Int, inout Int, inout Int) -> () = {pre, evenMorePre, saver in
        fibonocci_numbers.append(evenMorePre) // add to list to determine previous number later on
        print(evenMorePre)
        
        saver = pre
        pre = evenMorePre + pre // previous number added to current one 
        evenMorePre = saver
    }
    
    while previous < 1000 {
        maths(&previous, &evenMorePrevious, &saver) // & inout & inout & inout
    }
    // and once more
    maths(&previous, &evenMorePrevious, &saver)
}

fibonocci()

// playing with closures (they seem like worse functions)
// finds and prints the previous Fibo number, or tells you if its not one
var previous_fibo: (Int) -> () = { input in
    var count = 0
    for f in fibonocci_numbers {
        if f == input {
            print("The previous Fibonocci number of", input, "is", fibonocci_numbers[count - 1])
            return
        } else {count += 1}
    } 
    // NAN
    print(input, "is not a Fibonocci number")
}

// previous fibo if number printed out, if not a number then tells you
previous_fibo(377)
