import UIKit

var playerData = [Int:[Any]]()

let currentYear = Calendar.current.component(.year, from: Date()) // use to find out players birthdays (current year - birth year)

// probably would be better to make a list for each player, but whatever -> Joey Anderson, 15, RW, R, 6′0, 207, Jun 19, 1998, Roseville, Minnesota, USA
var number = [11, 71, 98, 43, 16, 8, 58, 17, 70];
var name = ["Taylor Raddysh", "Taylor Hall", "Connor Bedard", "Colin Blackwell", "Jason Dickinson", "Ryan Donato", "MacKenzie Entwistle", "Nick Foligno", "Cole Guttman"]
var position = ["RW", "LW", "C", "C", "C", "C", "RW", "LW", "C"]
var dominantHand = ["R", "L", "R", "R", "L", "L", "R", "L", "R"]
var height = ["6'3", "6'1", "5'10", "5'9", "6'2", "6'0", "6'3", "6'0", "5'9"]
var weight = ["198", "210", "185", "190", "200", "190", "205", "210", "167"]
var born = ["Feb 18, 1998", "Nov 14, 1991", "Jul 17, 2005", "Mar 28, 1993", "Jul 4, 1995", "Apr 9, 1996", "Jul 14, 1999", "Oct 31, 1987", "Apr 6, 1999"]
var bornAt = ["Caledon, Ontario, CAN", "Calgary, Alberta, CAN", "North Vancouver, British Columbia, CAN", "North Andover, Massachusetts, USA", "Georgetown, Ontario, CAN", "Boston, Massachusetts, USA", "Georgetown, Ontario, CAN", "Buffalo, New York, USA", "Northridge, California, USA"]


var count = 0
for i in number { // for each number (player)
    var player = [name[count],
                  position[count],
                  dominantHand[count],
                  height[count],
                  weight[count],
                  born[count],
                  bornAt[count]
    ]
    playerData[i] = player
    count+=1
}

//print(playerData)
//
//for (key, value) in playerData {
//    print(key, value[0])
//}

var playersByBirth: [Int:String] = [:] // should make these a 2d array so it does not write over players with the same birth year || or make the player name the hey, rather than the year

var playersByOrigin: [String:String] = [:]

var ages = [Int]()

var heightsInInches = [Int]()

var birthdayMonths: [String:Int] = [:]

for (key, value) in playerData {
    //Create a list of players sorted by age
    // get name and age of a player and add and sort to a list
    var playerBirthYear = Int(String(describing: value[5]).suffix(4)) ?? 0
    var player = [value[0], playerBirthYear]
    playersByBirth[playerBirthYear] = String(describing: value[0])

    //Create a list of players sorted by country
    var playerBirthLocation = String(describing: value[6]).suffix(3)
    var playerBirthLoc = [value[0], playerBirthLocation]
    playersByOrigin[String(describing: value[0])] = String(describing: playerBirthLocation)
    
    //Calculate the average age of the players
    let age = currentYear - playerBirthYear
    ages.append(age)
    
    //Calculate the average height of the players
    let heightInString = String(describing: value[3])
    let heightInArray = heightInString.components(separatedBy: "'")
    var feetToInches = Int(heightInArray[0]) ?? 0
    feetToInches = feetToInches * 12
    let inchesRemaining = Int(heightInArray[1]) ?? 0
    heightsInInches.append(feetToInches + inchesRemaining)
    
    
    //Determine the month in which most of the players birthday falls
    // get month
    let month = String(describing: value[5]).prefix(3)
    if let val = birthdayMonths[String(describing: month)] {
        birthdayMonths[String(describing: month)] = val + 1
    } else {
        birthdayMonths[String(describing: month)] = 1
    }

}

// sort stuff
let sortedByBirth = playersByBirth.sorted(){ $0.key < $1.key }
let sortedOrigin = playersByOrigin.sorted(){ $0.key < $1.key }

// print oldest to youngest
for (key, value) in sortedByBirth {
    print(String(describing: key) + " : " + value)
}
print(sortedByBirth)

// print sorted by birth location
for (key, value) in sortedOrigin {
    print(String(describing: key) + " : " + value)
}
print(sortedOrigin)

// get and print average age
var totalAge = 0
for i in ages {
    totalAge += i
}
print("Average Age is", totalAge / ages.count)                                                                                                             // age

// print average height
var totalHeight = 0
for i in heightsInInches {
    totalHeight += i
}
print(("Average Height:", totalHeight / heightsInInches.count / 12))                                                                                    // height

// print most months players have birthdays in
print(birthdayMonths)
if let mostBdays = birthdayMonths.max(by: {$0.value < $1.value}) {
    print("Most players Birthdays are in", mostBdays.key, "with", mostBdays.value, "players")                                                            // bdays
}

//TODO Provide a recipe with the ingredients and instructions to complete the Blackhawks lab.
