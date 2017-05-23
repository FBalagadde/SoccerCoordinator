/*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
 *  May 23, 2017                                                                                                                                                 *
 *  Project 1                                                                                                                                                    *
 *  Soccer League Coordinator in Swift                                                                                                                           *
 *  by FBalagadde                                                                                                                                                *
 *~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
 */

//Part 1. A dictionary collection constant that holds all the player data. key = Player Name, and values = height, experience, guardian's name and team name

let players: [String: (height: Int, playedSoccerBefore: String, guardiansName: String, teamName: String)] = [
    
    "Joe Smith":            (42,	"YES",	"Jim and Jan Smith",            "Not yet assigned"),
    "Jill Tanner":          (36,	"YES",	"Clara Tanner",                 "Not yet assigned"),
    "Bill Bon":             (43,	"YES",	"Sara and Jenny Bon",           "Not yet assigned"),
    "Eva Gordon":           (45,	"NO",	"Wendy and Mike Gordon",        "Not yet assigned"),
    "Matt Gill":            (40,	"NO",	"Charles and Sylvia Gill",      "Not yet assigned"),
    "Kimmy Stein":          (41,	"NO",	"Bill and Hillary Stein",       "Not yet assigned"),
    "Sammy Adams":          (45,	"NO",	"Jeff Adams",                   "Not yet assigned"),
    "Karl Saygan":          (42,	"YES",	"Heather Bledsoe",              "Not yet assigned"),
    "Suzane Greenberg":     (44,	"YES",	"Henrietta Dumas",              "Not yet assigned"),
    "Sal Dali":             (41,	"NO",	"Gala Dali",                    "Not yet assigned"),
    "Joe Kavalier":         (39,	"NO",	"Sam and Elaine Kavalier",      "Not yet assigned"),
    "Ben Finkelstein":      (44,	"NO",	"Aaron and Jill Finkelstein",   "Not yet assigned"),
    "Diego Soto":           (41,	"YES",	"Robin and Sarika Soto",        "Not yet assigned"),
    "Chloe Alaska":         (47,	"NO",	"David and Jamie Alaska",       "Not yet assigned"),
    "Arnold Willis":        (43,	"NO",	"Claire Willis",                "Not yet assigned"),
    "Phillip Helm":         (44,	"YES",	"Thomas Helm and Eva Jones",    "Not yet assigned"),
    "Les Clay":             (42,    "YES",	"Wynonna Brown",                "Not yet assigned"),
    "Herschel Krustofski":  (45,    "YES",  "Hyman and Rachel Krustofski",  "Not yet assigned")]


//Part 2
//Team Container: A dictionary of team members: key = Player Name, and values = height, experience, guardian's name and team name
var teamContainer: [String: (height: Int, playedSoccerBefore: String, guardiansName: String, teamName: String)] = [:]

//Array variable for the teams: An array of team dictionaries
var unbalancedTeamsArray: [[String: (height: Int, playedSoccerBefore: String, guardiansName: String, teamName: String)]] = [];

//Construction of empty array of teams: index 0 = Team Sharks, index 1 = Team Raptors, index 2 = Team Dragons
for count in 1...3
{
    unbalancedTeamsArray.append(teamContainer)
}

let teamNamesArray: [String] = ["Sharks", "Raptors", "Dragons"]                         // String array for storing team names for easy referencing downstream
let teamMeetTimesArray: [String] = ["March 17, 3pm", "March 18, 1pm", "March 17, 1pm"]  // String array for storing meeting times for each team for easy referencing downstream

var yesCount: Int = -1  //counter for players that have played before
var noCount: Int = -1   //counter for players that have not played before
var teamIndex: Int = -1 //index for the teams: index 0 = Team Sharks, index 1 = Team Raptors, index 2 = Team Dragons

//Populate the Teams in unbalancedTeamsArray with player information
for player in players
{
    var currentPlayer = player.value
    
    if currentPlayer.playedSoccerBefore == "YES"    //player has played before
    {
        yesCount += 1
        teamIndex = yesCount%3  //teamIndex = 0, 1, 2, 0, 1, 2, 0, 1, 2...
        unbalancedTeamsArray[teamIndex][player.key] = player.value
        unbalancedTeamsArray[teamIndex][player.key]?.teamName = teamNamesArray[teamIndex]
        
    }else if currentPlayer.playedSoccerBefore == "NO"  //player has never played before. The if statement here is redundant but I left it in for extra precaution
    {
        noCount += 1
        teamIndex = noCount%3   //teamIndex = 0, 1, 2, 0, 1, 2, 0, 1, 2...
        unbalancedTeamsArray[teamIndex][player.key] = player.value
        
        unbalancedTeamsArray[teamIndex][player.key]?.teamName = teamNamesArray[teamIndex]
    } //end else if
} //end Populate the Teams in teamsArray with player information


//*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*
//*     Utility Functions                                                             *
//*     1. func padString:         Function for String Padding                        *
//*     2. func getStringTokensOf: Function for tokenizing delimited strings          *
//*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*_*-*_-*


// Utility Function for String Padding
func padString(_ stringName: String, _ padding : Int) -> String
{
    
    let pad: Int = stringName.utf8.count
    var paddedString = stringName
    
    for count in 1..<(padding-pad)
    {
        paddedString += " "
    }
    
    return paddedString
} //end func padString

// Utility Function for tokenizing delimited strings
func getStringTokensOf(_ inputString: String, _ delimitChar: String) -> [String]{
    
    var tokens: [String] = []
    var tempString = ""
    
    for letter in inputString.characters {
        
        switch String(letter) {
        case String(delimitChar):
            tokens.append(tempString)
            tempString = ""
        default:
            tempString += String(letter)
        }
    }
    tokens.append(tempString)
    return tokens
} //end func getStringTokensOf


// Function to Print out player information for each team. Input = an array of team dictionaries
func printInformationFor(_ teamArray: [[String: (height: Int, playedSoccerBefore: String, guardiansName: String, teamName: String)]])
{
    var teamIndex: Int = -1;
    var teamNameStr: String = ""
    
    for team in teamArray
    {
        
        teamIndex += 1
        teamNameStr = (team.first?.value.teamName)!
        
        print("\n\(teamNameStr) players:")
        print("\(padString("Count", 8))\(padString("Name", 25))\(padString("Height(In)", 15))\(padString("Played Soccer Before", 30))\(padString("Guardian's Name", 30))")
        
        var heightSum: Double = 0;
        var playerCount: Double = 0;
        
        for player in team  //Print player-specific information
        {
            heightSum += Double(player.value.height)
            playerCount += 1
            
            print("\(padString(String(Int(playerCount)), 8))\(padString(player.key, 25))\(padString(String(player.value.height), 15))\(padString(player.value.playedSoccerBefore, 30))\(padString(player.value.guardiansName, 30))")
        }
        
        print("\n\(teamNameStr) Average Height:\t\t   \(heightSum/playerCount)")
    }
} // end func printInformationFor


//Print out player information for the different teams
print("Team member information BEFORE balancing average Height")
printInformationFor(unbalancedTeamsArray)
print("==========================================================================================\n")



/*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
 *  Extra Credit: Logic to ensure that the each team's average height is within 1.5 inches of the others                                           *
 *  Code will ensure that team average heights are as closely matehced as possible                                                                 *
 *                                                                                                                                                 *
 *  Approach:                                                                                                                                      *
 *  First sort all the players in descending order of height for the experienced and inexperienced players separately                              *
 *  In each of the sortted lists, Bin each player into the three teams: 0 = Sharks, 1 = Raptors, 2 = Dragons                                       *
 *  Use the sequence: [0 1 2, 2 1 0, 1 2 0] to avoid advantaging team Sharks given that the players' heights are sorted in descending order        *
 *~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
 */


var binnedExperienedKeys: [String] = [] //Array to store binned keys (names) for experienced players
var binnedNoExperieneKeys: [String] = [] //Array to store binned keys (names) for inexperienced players

var minExperiencedHeight: Int = 0
var minNoExperienceHeight: Int = 0

let numberExperiencedPlayers: Int = yesCount + 1    //counter for players that have played before
let numberNoExperiencePlayers: Int = noCount + 1    //counter for players that have not played before

yesCount = -1  //counter for players that have played before
noCount = -1   //counter for players that have not played before
teamIndex = -1 //index for the teams: index 0 = Team Sharks, index 1 = Team Raptors, index 2 = Team Dragons



//Array container for height-balanced teams: An array of team dictionaries
var balancedTeamsArray: [[String: (height: Int, playedSoccerBefore: String, guardiansName: String, teamName: String)]] = [];

//Construct array of with 3 elements representing the 3 teams: index 0 = Team Sharks, index 1 = Team Raptors, index 2 = Team Dragons
for count in 1...3 {
    balancedTeamsArray.append(teamContainer)
}


//Populate the Teams in balancedTeamsArray with player information
var tempPlayerString: String = ""
var tempNoExpPlayerString: String = ""
var playerIndex: Int = -1;


for index in 1...players.count
{
    minExperiencedHeight = 0
    minNoExperienceHeight = 0
    
    for player in players
    {
        if ((player.value.playedSoccerBefore == "YES") && (player.value.height > minExperiencedHeight) && !binnedExperienedKeys.contains(player.key))
        {
            minExperiencedHeight = player.value.height
            tempPlayerString = player.key
        }
        
        if ((player.value.playedSoccerBefore == "NO") && (player.value.height > minNoExperienceHeight) && !binnedNoExperieneKeys.contains(player.key))
        {
            minNoExperienceHeight = player.value.height
            tempNoExpPlayerString = player.key
        }
    }
    
    
    if !binnedExperienedKeys.contains(tempPlayerString)
    {
        binnedExperienedKeys.append(tempPlayerString)
        //print("\(tempPlayerString)  \(minExperiencedHeight)")
        
        for player in players
        {
            if player.key == tempPlayerString
            {
                playerIndex = binnedExperienedKeys.count - 1
                playerIndex = (playerIndex + (3 - (playerIndex/3)%3) )%3
                
                balancedTeamsArray[playerIndex][player.key] = player.value
                balancedTeamsArray[playerIndex][player.key]?.teamName = teamNamesArray[playerIndex]
                
                //print(playerIndex)
            }
        }
    }
    
    if !binnedNoExperieneKeys.contains(tempNoExpPlayerString)
    {
        binnedNoExperieneKeys.append(tempNoExpPlayerString)
        //print("\(tempNoExpPlayerString)  \(minNoExperienceHeight)")
        
        for player in players
        {
            if player.key == tempNoExpPlayerString
            {
                playerIndex = binnedNoExperieneKeys.count - 1
                playerIndex = (playerIndex + (3 - (playerIndex/3)%3) )%3
                
                balancedTeamsArray[playerIndex][player.key] = player.value
                balancedTeamsArray[playerIndex][player.key]?.teamName = teamNamesArray[playerIndex]
            }
        }
    }
}


print("\n\nExtra Credit:\nTeam member information AFTER balancing average Height")
printInformationFor(balancedTeamsArray)
print("==========================================================================================\n")


//Part 3
//Function for creating array of personalized letter strings for each player
func createPersonalizedLettersFor(_ teamArray: [[String: (height: Int, playedSoccerBefore: String, guardiansName: String, teamName: String)]], teamMeetTimesArray: [String]) -> [String]
{
    var teamCout: Int = -1
    
    var letterString: String = ""
    var letters: [String] = []
    
    for team in teamArray
    {
        teamCout += 1
        let dateAndTime: [String] = getStringTokensOf(teamMeetTimesArray[teamCout], ",")
        
        for player in team
        {
            letterString = "\n\nMay 21, 2017\n\nRE: Soccer Team Placement for " + player.key + ".\n\nDear " + player.value.guardiansName + ",\nWe are very pleased to let you know that " + player.key + "has been successfully placed with soccer team " + player.value.teamName + ". The first team practice is scheduled for " + dateAndTime[0] + "th at"+dateAndTime[1] + ". Your attendence at this event is kindly required.\n\nSincerely,\n\nSoccer Club Management Team\n"
            
            letters.append(letterString)
        }
    }
    
    return letters
}


let playerLetters: [String] = createPersonalizedLettersFor(balancedTeamsArray, teamMeetTimesArray: teamMeetTimesArray)

//Print out the personalized letters for each player
for letter in playerLetters
{
    print(letter)
    print("---------------------------------------------")
}


////////////////////////////////////// The End ////////////////////


