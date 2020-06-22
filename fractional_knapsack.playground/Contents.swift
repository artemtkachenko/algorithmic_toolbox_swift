
/// Fraction Knapsack
/// We have n items with weights w1 through wn and values v1 though vn
/// And a bag of capacity big W. And we want to maximize
/// the total value of fractions of items that fit into this bag.
/// input max size: 7
/// input array: [(20, 4), (18, 3), (14, 2)]
/// output: [(14, 2), (18, 3), (10, 2)]


func calculateBestLoad(inputArray: [(Int, Int)], maxLoad: Int) -> [(Int, Int)] {
    var currentLoad = 0
    var result: [(Int, Int)] = []

    var sortedInput = inputArray
    sortedInput.sort { (left, right) -> Bool in
        return left.0/left.1 > right.0/right.1
    }
    
    for i in 0..<sortedInput.count {
        let itemWeight = sortedInput[i].1
        if (currentLoad <= itemWeight) {
            currentLoad = currentLoad + itemWeight
            result.append(sortedInput[i])
        } else {
            let leftWeight = maxLoad - currentLoad
            let restAmount: Float = Float(sortedInput[i].0) * Float(leftWeight)/Float(itemWeight)
            result.append((Int(restAmount), leftWeight))
            break
        }
    }
    return result
}

print("best load = \(calculateBestLoad(inputArray: [(14, 2), (20, 4), (18, 3)], maxLoad: 7))")
