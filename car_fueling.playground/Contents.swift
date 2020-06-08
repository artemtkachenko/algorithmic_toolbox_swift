
/// Car Fueling Programming Challenge
/// A car which can travel at most L kilometers with full tank,
/// a source point A, a destination point B and N gas station at distances:
/// x1  x2  x3 xn in kilometers from A along the path from A to B.
/// Output:
/// The minimum number of refills get from A to B, besides refill at A.
///
///


func minRefils(path: [Int], tank: Int) -> Int {
    
    var currentRefill = 0
    var numberOfRefills = 0
    
    while currentRefill < path.count - 1 {
        let lastRefill = currentRefill

        while ((currentRefill < path.count - 1)
            && (path[currentRefill + 1] - path[lastRefill] <= tank)) {
                currentRefill = currentRefill + 1
        }
        if currentRefill == lastRefill {
            return -1
        }
        if currentRefill <= path.count {
            numberOfRefills = numberOfRefills + 1
        }
        print("currentRefill = \(currentRefill) numberOfRefills = \(numberOfRefills)")
    }
    
    return numberOfRefills
}

//let distances = [300, 375, 450, 600, 800]
//let distances = [150, 200, 350, 400]
let distances = [0, 200, 375, 550, 750, 950]
let litersPerTank = 400

print("min refils: \(minRefils(path: distances, tank: litersPerTank))")
