import Foundation

/*
 When someone searches their contacts based on a phone number, it's nice when a list
 of contact pops up.
 
 Write an algorithm that searches you contacts for phone number strings, and returns:
  - NO CONTACT if contact can't be found
  - A contact if a contact is found
  - The first alphabetized contact if there are multiple
 
 A = ["pim", "pom"]             // Contacts (return one of these)
 B = ["999999999", "777888999"] // Phone numbers for each contact A[i] = B[i]
 P = "88999"                    // Search phrase

 Answer should be correct. Don't worry about performance.
 */

class Possibilitie {
    var id : Int
    var name : String
    
    init (id : Int, name : String) {
        self.id = id
        self.name = name
    }
}

public func solution(_ A : [String], _ B : [String], _ P : String) -> String {
    var possibilities : [Possibilitie] = []
    
    var i : Int = 0
    for phoneNumber in B {
        if phoneNumber.contains(P) {
            possibilities.append(Possibilitie(id: i, name: A[i]))
        }
        
        i+=1
    }
    
    if possibilities.count == 0 {
        print("NO CONTACT")
        return "NO CONTACT"
    }
    
    let sorted = possibilities.sorted { $0.name < $1.name }
    
    print(sorted[0].name)
    return sorted[0].name
}

let A = ["pim", "pom"]
let B = ["999999999", "777888999"]
let P = "88999"

solution(A, B, P)   // pom
solution(["sander", "amy", "ann"], ["12345", "23456", "123"], "1")  // ann
solution(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112")   // NO CONTACT

// edge cases
//solution([String](), [String](), "")
//solution(A, B, "")

public func solutionDict(_ A : [String], _ B : [String], _ P : String) -> String {
    // 🕹 Game on here
    return ""
}



