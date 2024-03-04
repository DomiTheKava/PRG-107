import UIKit

struct daily_chores {
    // false = not done, true = done
    var goats = false
    var chickens = false
    var cleanedDishes = false
    var madeBed = false
    var fedCats = false
}

var toDo = daily_chores()

func doSomeThingUseful() {
    
    // the closure
    var steps: (String, [String]) -> () = { goal, steps in
        var step = 0
        print(goal)
        for s in steps {
            step += 1
            print("\(step): \(s)")
        }
        print() // new line
    }

    print("To Do Today")
    print("-----------")
    
    if toDo.goats == false {
        steps("Goats", ["Fill water", "Feed goats", "Clean bedding"])
    }
    
    if toDo.chickens == false {
        steps("Chickens", ["Fill water", "Fill food", "Collect eggs", "Clean bedding"])
    }

    if toDo.cleanedDishes == false {
        steps("Dishes", ["Empty dishwasher", "Load dishwasher", "if dishwasher is full, start it.", "Clean dishes by hand", "Dry dishes", "Put away"])
    }

    if toDo.madeBed == false {
        steps("Make Bed", ["Take off bedding", "Put on bedding, but make it look nice"])
    }
    
    if toDo.fedCats == false {
        steps("Feed Cats", ["Find bowls", "fill bowls 1/8 full", "mix in wet food with dry food", "put bowls on the ground"])
    }
    
    if toDo.goats == true && toDo.chickens == true && toDo.cleanedDishes == true && toDo.madeBed == true && toDo.fedCats == true {
        print("You've finished you tasks for today!")
    } else {
        print("\nYou still have work to do.")
    }
}

doSomeThingUseful()
