import UIKit

func move(){
    
        // random player movement
    playerPos.x += Int.random(in: -1...1)
    playerPos.y += Int.random(in: -1...1)
    
       // random creature movement
    creaturePos.x += Int.random(in: -1...1)
    creaturePos.x -= Int.random(in: -1...1)
    
        // bounds
    if playerPos.x > 9 {
        playerPos.x = 9
    } else if playerPos.x < 1 {
        playerPos.x = 1
    }
    if playerPos.y > 9 {
        playerPos.y = 9
    } else if playerPos.y < 1 {
        playerPos.y = 1
    }
    if creaturePos.x > 9 {
        creaturePos.x = 9
    } else if creaturePos.x < 1 {
        creaturePos.x = 1
    }
    if creaturePos.y > 9 {
        creaturePos.y = 9
    } else if creaturePos.y < 1 {
        creaturePos.y = 1
    }
    
    print(Render(playerY: playerPos.y, PlayerX: playerPos.x, creatureY: creaturePos.y, creatureX: creaturePos.x))
    print("🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫")
}

func Render(playerY: Int, PlayerX: Int, creatureY: Int, creatureX: Int) -> String{
    var place = ""
    
    // right
    var xCoord = 0
    // down
    var yCoord = 0
    
    var placed = false
      // y coords
    for y in 1...9 {
        place += "🟫 "
        xCoord = 0
        yCoord += 1
          // x coords
        for x in 1...9{
            xCoord += 1
            // check to see if player or creature has the x and y value, if so, place creature and do not place grass tile
            if creatureX == xCoord && creatureY == yCoord {
                place += "🟥 "
                placed = true
            }
            if PlayerX == xCoord && playerY == yCoord {
                place += "🟦 "
                placed = true
            }
            if placed == false {
                place += "🟩 "
            } else {
                placed = false
            }
        }
        place += "🟫"
        
        if y != 9 {
            place += "\n"
        }
        
    }
    return place
}

func isClose(pX: Int, pY: Int, cX: Int, cY: Int) -> Bool {
    
                    // Euclidean distance formula
    var dist = sqrt(pow(Double(cX - pX), 2) + pow(Double(pY - cY), 2))
    if (Int(dist) <= sight) {
        return true
    } else {
        return false
    }
    
}

//   Y
// X   1 2 3 4 5 6 7 8 9
//   1
//   2
//   3
//   4
//   5
//   6
//   7
//   8
//   9

var creaturePos = (x: 9, y: 1) // starting position

var playerPos = (x: 1, y: 9) // starting position

var sight = 1 // how many tiles away can the player see

let maxAttempts = 100 // movement attempts

var pIsClose = false // is player close
var attempts = 0

print("🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫")
print(Render(playerY: playerPos.y, PlayerX: playerPos.x, creatureY: creaturePos.y, creatureX: creaturePos.x))
print("🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫 🟫")

while pIsClose == false{
    attempts += 1
    
    move() // move player and creature
    
    if isClose(pX: playerPos.x, pY: playerPos.y, cX: creaturePos.x, cY: creaturePos.y) == true{
        print("Player found the creature!")
        print("Rounds: \(attempts)")
        pIsClose = true
    }
    if attempts == maxAttempts {
        pIsClose = true
        print("Player never found the creature.")
        print("Rounds: \(attempts)")
    }
}

// Goal: Come up with a program idea that uses what you learned about operators creatively!
