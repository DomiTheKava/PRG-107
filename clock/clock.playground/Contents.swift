import UIKit


// Critical Thinking Exercise: Flow Exercise
// Assignment: Design A Clock App

let timeInSeconds: Int = 314159 // initialize the timer

var timer = timeInSeconds // update through program

while (true) {
    if timer != 0 { // is timer done
        // initalize stuff
        var hours = 0
        var minutes = 0
        var seconds = 0
        
        timer -= 1 // minus 1 second
        
        sleep(1) // 1 second dalay (not good in responsivness because is delays execution of stuff in program)
        
        hours = timer / 3600 // hours
        minutes = (timer % 3600) / 60 // minutes
        seconds = timer % 60 // seconds
        
        print (hours)
        print (minutes)
        print (seconds)
    } else {break} // timer is done
}
