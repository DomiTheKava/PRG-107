import UIKit

var clockIngrediants: [String: String] = ["Material": "Oak Wood", "Type": "Analog", "Mount": "Wall"]

print("watch material: " + clockIngrediants["Material"]!)
print("watch type: " + clockIngrediants["Type"]!)
print("watch mount: " + clockIngrediants["Mount"]!)

clockIngrediants["Material"] = "Metal"
clockIngrediants["Type"] = "Digital"
clockIngrediants["Mount"] = "Wrist"

print("watch material: " + clockIngrediants["Material"]!)
print("watch type: " + clockIngrediants["Type"]!)
print("watch mount: " + clockIngrediants["Mount"]!)
