import UIKit

// order list
var order: [Food] = []

// Order Goes Here

order += [Food(foodType: foodType.burger,
           toppings: Toppings(ketchup: false, mayo: true).listToppings(),
           drink: drinkType.drPepper)
]

order += [Food(foodType: foodType.burger, 
           toppings: Toppings(none: true).listToppings(),
           drink: drinkType.drPepper)
]

order += [Food(foodType: foodType.fries,
               toppings: Toppings(ketchup: true).listToppings(),
               drink: drinkType.water)
]

order += [Food(foodType: foodType.burger,
               toppings: [nil],
               drink: nil)
]

//

// function for printing receipt
reciept()

// structure of structures
struct Food {
    let foodType: foodType? // enum
    let toppings: [String?] // struct
    let drink: drinkType? // enum
}

// toppings
struct Toppings {
    //default toppings
    var ketchup: Bool = false
    var mustard: Bool = false
    var pickles: Bool = true
    var lettuce: Bool = true
    var tomato: Bool = true
    var mayo: Bool = false
    var cheese: Bool = true
    
    var none: Bool = false
    
    func listToppings() -> [String?] {
        
        var toppingList: [String?] = []
        
        // changes to default
        if !none {
            if ketchup {
                toppingList.append("Ketchup")
            }
            if mustard {
                toppingList.append("Mustard")
            }
            if !pickles {
                toppingList.append("No Pickles")
            }
            if !lettuce {
                toppingList.append("No lettuce")
            }
            if !tomato {
                toppingList.append("No Tomato")
            }
            if mayo {
                toppingList.append("Mayo")
            }
            if !cheese {
                toppingList.append("No Cheese")
            }
        } else {toppingList.append("No Toppings")}
        
        return toppingList
        
    }
}

enum foodType {
    case burger
    case fries
    case drink
}

enum drinkType {
    case water
    case drPepper
    case coke
    case fanta
}

// loop through order list, calculate total, print changes and order in reciept form.
func reciept() {
    
    var total = 0.0
    
    for i in order {
        
        // prices (based on the enum)
        if i.foodType == foodType.burger {
            total += 10.99
        } else if i.foodType == foodType.fries {
            total += 5.99
        } else if i.foodType == foodType.drink {
            total += 1.99
        }
        
        guard let nullSafeFoodType = i.foodType else {
            continue
        }
        
        print(nullSafeFoodType)
        
        // any toppings?
        for top in i.toppings {
            guard let topper = top else {
                continue
            }
            
            if !topper.isEmpty { print("\t", topper) }
            
        }
        
        guard let nullSafeDrinkType = i.drink else {
            continue
        }
        print("\t", nullSafeDrinkType)

    }
    print("\ntotal: $\(total)")
}
