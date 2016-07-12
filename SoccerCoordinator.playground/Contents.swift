//: Playground - noun: a place where people can play

import UIKit

///////////////
/////////////// Part 1 - Storage
///////////////

// dictionaries of each player's information
let joe1Dict: [String : Any]  = ["name": "Joe Smith", "height": 42, "exp": true, "guardians": "Jim and Jan Smith"]

let jillDict: [String : Any]  = ["name": "Jill Tanner","height": 36, "exp": true, "guardians": "Clara Tanner"]

let billDict: [String : Any]  = ["name": "Bill Bon", "height": 43, "exp": true, "guardians": "Sara and Jenny Bon"]

let evaDict: [String : Any]  = ["name": "Eva Gordon", "height": 45, "exp": false, "guardians": "Wendy and Mike Gordon"]

let mattDict: [String : Any]  = ["name": "Matt Gill", "height": 40, "exp": false, "guardians": "Charles and Sylvia Gill"]

let kimmyDict: [String : Any]  = ["name": "Kimmy Stein", "height": 41, "exp": false, "guardians": "Bill and Hillary Stein"]

let sammyDict: [String : Any]  = ["name": "Sammy Adams", "height": 45, "exp": false, "guardians": "Jeff Adams"]

let karlDict: [String : Any]  = ["name": "Karl Saygan", "height": 42, "exp": true, "guardians": "Heather Bledose"]

let suzaneDict: [String : Any]  = ["name": "Suzane Greenberg", "height": 44, "exp": true, "guardians": "Henritta Dumas"]

let salDict: [String : Any]  = ["name": "Sal Dali", "height": 41, "exp": false, "guardians": "Gala Dali"]

let joe2Dict: [String : Any]  = ["name": "Joe Kavalier", "height": 39, "exp": false, "guardians": "Sam and Elaine Kavalier"]

let benDict: [String : Any]  = ["name": "Ben Finkelstein", "height": 44, "exp": false, "guardians": "Aaron and Jill Finkeltstein"]

let diegoDict: [String : Any]  = ["name": "Diego Soto", "height": 41, "exp": true, "guardians": "Robin and Sarika Soto"]

let chloeDict: [String : Any]  = ["name": "Chloe Alaska", "height": 47, "exp": false, "guardians": "David and Jamie Alaska"]

let arnoldDict: [String : Any]  = ["name": "Arnold Willis", "height": 43, "exp": false, "guardians": "Claire Willis"]

let phillipDict: [String : Any]  = ["name": "Phillip Helm", "height": 44, "exp": true, "guardians": "Thomas Helm and Eva Jones"]

let lesDict: [String : Any]  = ["name": "Les Clay", "height": 42, "exp": true, "guardians": "Wynonna Brown"]

let herschelDict: [String : Any]  = ["name": "Herschel Krustofski", "height": 45, "exp": true, "guardians": "Hyman and Rachel Krustofski"]

// placing the players information in an array

let allPlayers = [joe1Dict, jillDict, billDict, evaDict, mattDict, kimmyDict, sammyDict, karlDict, suzaneDict, salDict, joe2Dict, benDict, diegoDict, chloeDict, arnoldDict, phillipDict, lesDict, herschelDict]

/* To do the exceeds expectations work: we have to organize all players by their height
 I took quite a bit of time to decide how to deal with distribution without making the code complicated or being too reliant on special numbers including those given. Something I originally considered was that being taller was an advantage, but after carefully considering the exercise I decided this bias didn't exist in the directions. So I decided to simply distribute height as evenly as possible while considering exp to be more important. Afterwards I'll simply check for the 1.5 inch difference in average height.
 */


///(EXCEEDS) If the players are sorted here by height they will continue to be sorted by height when they are put in the exp arrays
//var allPlayersSortedByHeight: [[String : Any]] = []

//while allPlayers.count == allPlayersSortedByHeight.count {
//    
//    for player in allPlayers {
//        
//        var shortestPlayerHeight = Int.max //inches
//        var shortestPlayer: [String : Any]
//        
//        if (player["height"] as? Int) < shortestPlayerHeight {
//            
//            shortestPlayer = player
//        
//        }
//    
//    }
//
//    allPlayersSortedByHeight.append(shortestPlayer)
//    
//}

// this seems the best way to sort the players into an ascending list
   let allPlayersSortedByHeight = allPlayers.sort { (firstPlayer, secondPlayer) -> Bool in
        (firstPlayer["height"] as? Int) < (secondPlayer["height"] as? Int)
}


///////////////
/////////////// Part 2 - distribute the players to teams
///////////////

//two new arrays to divide players based on exp

var playersWithExp: [[String : Any]] = []
var playersWithoutExp: [[String : Any]] = []

// create loop to divide the plyers by experience into the two new arrays via their exp
for player in allPlayersSortedByHeight {
    
    //with exp
    if player["exp"] as? Bool == true {
        playersWithExp.append(player)
    }
    //without exp
    else {
        playersWithoutExp.append(player)
    }
}

// check seperated lists
playersWithExp
playersWithoutExp

// now go through the exp array and distribute the playerDicts equally between the team arrays that follow
var sharks: [[String : Any]] = []
var dragons: [[String : Any]] = []
var raptors: [[String : Any]] = []

//** This will distribute evenly if the exp and no exp arrays are divisible by the number of teams, otherwise there might be additional code required to keep the teams as even as possible
while playersWithExp.count != 0 {
    
    sharks.append(playersWithExp[0])
    playersWithExp.removeAtIndex(0)
    
    dragons.append(playersWithExp[0])
    playersWithExp.removeAtIndex(0)
    
    raptors.append(playersWithExp[0])
    playersWithExp.removeAtIndex(0)

}

while playersWithoutExp.count != 0 {
 
// // This switch makes the averages closer although they were within limit the other way
//
//    sharks.append(playersWithoutExp[0])
//    playersWithoutExp.removeAtIndex(0)
//    
//    dragons.append(playersWithoutExp[0])
//    playersWithoutExp.removeAtIndex(0)
    
    raptors.append(playersWithoutExp[0])
    playersWithoutExp.removeAtIndex(0)
    
    dragons.append(playersWithoutExp[0])
    playersWithoutExp.removeAtIndex(0)
    
    sharks.append(playersWithoutExp[0])
    playersWithoutExp.removeAtIndex(0)

}

// check teams
sharks
dragons
raptors

///////(EXCEEDS) creating a function to figure out the average height of each team so someone can compare
func getAverageHeight(team: [[String : Any]]) -> Double {
    
    var sumHeight: Double = 0.0
    for player in team {
        
        sumHeight = sumHeight + Double((player["height"] as? Int)!)
        
    }
    
    
    return sumHeight / Double(sharks.count)
    
}



// check average (all within 1.5 inches of one another!!)
var sharksAvgHeight = getAverageHeight(sharks)
var dragonsAvgHeight = getAverageHeight(dragons)
var raptorsAvgHeight = getAverageHeight(raptors)

///////////////
/////////////// Part 3 - Notify the Parents/Guardians
///////////////

// This func will go through each team and notify the guardians of their team and first practice

func notifyParentsAndGuardians(team: [[String : Any]], teamName : String, dateOfFirstPractice: String) {
    
    for player in team {
        
        print("Hi, \((player["guardians"])!) \r Congratulations!!!!  \((player["name"])!) has been drafted to the \(teamName)! We are sure to have a strong season with the addition of your child!! Our first practice will be held on \(dateOfFirstPractice). Don't forget a water bottle. Staying hydrated is important as we expect a warm and sunny day. See you there!")
    }
    
}

// This seems the easiest way to ensure each team has the correct information. The addition of a few more teams and it might make sense to store this information.
notifyParentsAndGuardians(dragons, teamName: "Dragons", dateOfFirstPractice: "March 17, 1pm")
notifyParentsAndGuardians(sharks, teamName: "Sharks", dateOfFirstPractice: "March 17, 3pm")
notifyParentsAndGuardians(raptors, teamName: "Raptors", dateOfFirstPractice: "March 18, 1pm")





