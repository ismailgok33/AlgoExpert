import UIKit

let HOME_TEAM_WON = 1

// Solution-1
// Time: O(n) where n is the size of the competitions array
// Space: O(k) where k is the number of teams
func tournamentWinner(_ competitions: [[String]], _ results: [Int]) -> String {
    
    var dict = [String: Int]()
    var winner = ""
    var maxScore = 0
    
    for (i, teams) in competitions.enumerated() {
        if results[i] == HOME_TEAM_WON {
            let homeTeam = teams[0]
            var homeTeamScore = dict[homeTeam] ?? 0
            
            dict[homeTeam, default: 0] += 3
            homeTeamScore = dict[homeTeam]!
            
            if homeTeamScore > maxScore {
                maxScore = homeTeamScore
                winner = homeTeam
            }
        }
        else {
            let awayTeam = teams[1]
            var awayTeamScore = dict[awayTeam] ?? 0
            
            dict[awayTeam, default: 0] += 3
            awayTeamScore = dict[awayTeam]!
            
            if awayTeamScore > maxScore {
                maxScore = awayTeamScore
                winner = awayTeam
            }
        }
    }
  
    return winner
}

var competitions = [
    ["HTML", "C#"],
    ["C#", "Python"],
    ["Python", "HTML"]
  ]

var results = [0, 0, 1]

print( tournamentWinner(competitions, results))

competitions = [["A", "B"]]
results = [0]
print( tournamentWinner(competitions, results))
