import UIKit

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */

func solution(A: [Int], K: Int) -> [Int] {
    var res : [Int] = A
    
    print("")
    print("Original: \(A)")
    
    for i in 0..<K {
        res = incrementInArray(A: res)
    }
    
    print("Response: \(res)")
    return [Int]()
}

func incrementInArray(A : [Int]) -> [Int] {
    var newArr : [Int] = []
    
    for j in 0 ..< A.count {
        if j == A.count - 1 {
            newArr.insert(A[j], at: 0)
        } else {
            newArr.append(A[j])
        }
    }
    
    return newArr
}

solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2

solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]

