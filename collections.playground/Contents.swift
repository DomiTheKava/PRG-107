import UIKit
var gameCollection: [String:[String]] = [:]

// stored data for each game ->
// game name (as the key)
// system (as array value)
// genre (as array value)
// <-

// wii
//Super Mario Galaxy
//The Legend of Zelda: Twilight Princess
//Super Smash Bros. Brawl
//Mario Kart Wii
addItem("Super Mario Galaxy", 1, "Platformer")
addItem("The Legend of Zelda: Twilight Princess", 1, "Action-Adventure")
addItem("Super Smash Bros. Brawl", 1,"Fighting")
addItem("Mario Kart Wii", 1, "Racing")

// xbox 360
// Batman: Arkham City
// minecraft: legacy edition
addItem("Batman: Arkham City", 2,"Fighting")
addItem("Minecraft: legacy edition", 2, "Adventure")

// nds
//New Super Mario Bros.
//The Legend of Zelda: Phantom Hourglass
//Pokémon HeartGold and SoulSilver
//Mario Kart DS
addItem("New Super Mario Bros.", 3, "Platformer")
addItem("The Legend of Zelda: Phantom Hourglass", 3, "Action-Adventure")
addItem("Pokémon HeartGold and SoulSilver", 3, "Role-Playing")
addItem("Mario Kart DS", 3, "Racing")

// Nintendo Switch
//The Legend of Zelda: Breath of the Wild
//The Legend of Zelda: Tears of the Kindom
//Animal Crossing: New Horizons
//Mario Kart 8 Deluxe
//Splatoon 2
//Splatoon 3
//Super Smash Bros. Ultimate
addItem("The Legend of Zelda: Breath of the Wild", 4, "Action-Adventure")
addItem("The Legend of Zelda: Tears of the Kindom", 4, "Action-Adventure")
addItem("Animal Crossing: New Horizons", 4, "Life Simulation")
addItem("Mario Kart 8 Deluxe", 4, "Racing")
addItem("Splatoon 2", 4, "Third Person Shooter")
addItem("Splatoon 3", 4, "Third Person Shooter")
addItem("Super Smash Bros. Ultimate", 4, "Fighting")



// organize stuff
var organizedByGenre = gameCollection.sorted(by: {$0.value[0] < $1.value[0]})

var organizedBySystem = gameCollection.sorted(by: {$0.value[1] < $1.value[1]})

var organizedByName = gameCollection.sorted(by: {$0.key < $1.key})



// print organized stuff
print(organizedByGenre)
print(organizedBySystem)
print(organizedByName)



// add data to gameCollection Dictionary (name as the key, genre and console as the value - within a array)
// constole - 1 = wii, 2 = xbox 360, 3 = nds, 4 = switch
func addItem(_ name: String, _ console: Int, _ genre: String) {
    // default
    var console_type = "N/A"
    // see what system
    switch console {
    case 1:
        console_type = "Wii"
    case 2:
        console_type = "Xbox 360"
    case 3:
        console_type = "Nintendo Ds"
    case 4:
        console_type = "Nintendo Switch"
    default:
        console_type = "N/A"
    }
    // make it array (save this to dictionarys value)
    let game: [String] = [
        genre,
        console_type
    ]
    // add data to dicitonary
    gameCollection[name] = game
}



// get and print the random game - tells you what genre and system it is!
let random_game = randomGame(gameCollection) // games name
let gameData = gameCollection[random_game]! // games details
print("Your naxt game you should play is", random_game, "it is a", gameData[0], "game on the", gameData[1])



// pick a random game to play, return the key value as a string (the name of the game)
func randomGame(_ games: [String:[String]]) -> String {
    return games.randomElement()?.key ?? "N/A"
}
