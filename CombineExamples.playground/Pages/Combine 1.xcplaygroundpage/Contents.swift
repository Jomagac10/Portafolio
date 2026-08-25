import UIKit
import Combine


//MARK: - Method 1 sink

let initialArray: [String] = ["1","2","3"]
let publisher = initialArray.publisher

publisher.sink { isFinished in
    print("isFinished: \(isFinished)")
} receiveValue: { value in
    print("received Value: \(value)")
}

//MARK: - Method 2 Just
let just = Just(["1","2","3"])

class School {
    var students: Int = 0
}

let justSchool = Just(20)
let unam = School()
justSchool.assign(to: \School.students, on: unam)
print("Students in UNAM: \(unam.students)")
