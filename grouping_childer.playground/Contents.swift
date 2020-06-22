
/// Celebration party problem
/// You've invited a lot of children to a celebration party,
/// and you want to entertain them and also teach them something in the process.
/// You are going to hire a few teachers and divide the children into groups
/// and assign a teacher to each of the groups this teacher
/// will work with this group through the whole party.
/// Input array (positive only):
/// [3.5, 5, 3.2, 5.8, 8.2, 8.2, 8.5, 5.2, 3]
/// segment: 1.0
/// output result: [3, 3.2, 3.5], [5, 5.2, 5.8], [8.2, 8.2, 8.5]


func group(inputArray: [Float], segment:Float) -> [[Float]] {
    
    var result: [[Float]] = []
    var sortedArray = inputArray
    sortedArray.sort(by: { $1 > $0})

    var candidateArray: [Float] = [sortedArray[0]]
    for i in 1..<sortedArray.count {
        let item = sortedArray[i]
        print("i=\(i) item=\(item) candidateArray=\(candidateArray) result=\(result)")
        if ((item - candidateArray[0]) <= segment) {
            candidateArray.append(item)
        } else {
            print("append candidateArray=\(candidateArray)")
            result.append(candidateArray)
            candidateArray.removeAll()
            candidateArray.append(item)
        }
        if (i == sortedArray.count - 1) {
            result.append(candidateArray)
        }
    }
    return result
}


print("\(group(inputArray: [3.5, 5, 3.2, 5.8, 8.2, 8.2, 8.5, 5.2, 3, 12, 15, 16.1, 12.2, 13], segment: 1.0))")
