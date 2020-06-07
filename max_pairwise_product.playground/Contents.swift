
/// Maximum Pairwise Product Programming Challenge
/// Input array (positive only):
/// [1, 2, 3]
/// output result: 6
/// input[1] multiply by input[2] == 2 multiply by 3 == 6

func maxPairwiseProductBrutForce(inputNumbers: [Int64]) -> Int64 {
    var result: Int64 = 0
    for i in 0..<inputNumbers.count {
        let jStartIndex = i + 1
        for j in jStartIndex..<inputNumbers.count {
            let productCandidate = inputNumbers[i] * inputNumbers[j]
            if (productCandidate > result) {
                result = productCandidate
            }
        }
    }
    return result
}

func maxPairwiseProductOptimized(inputNumbers: [Int64]) -> Int64 {
    var result: Int64 = 0
    
    var maxLeftPairIndex: Int = -1
    var maxRightPairIndex: Int = -1
    
    var maxLeftNumber: Int64 = -1
    var maxRightNumber: Int64 = -1

    for i in 0..<inputNumbers.count {
        let maxNumberCandidate = inputNumbers[i]
        if (maxNumberCandidate > maxLeftNumber) {
            if (maxLeftNumber > maxRightNumber) {
                maxRightPairIndex = maxLeftPairIndex
                maxRightNumber = maxLeftNumber
            }
            maxLeftPairIndex = i
            maxLeftNumber = maxNumberCandidate
        } else if (maxNumberCandidate > maxRightNumber) {
            maxRightPairIndex = i
            maxRightNumber = maxNumberCandidate
        }
    }
    
    if (maxLeftPairIndex != -1 && maxRightPairIndex != -1) {
        result = inputNumbers[maxLeftPairIndex] * inputNumbers[maxRightPairIndex]
    } else if (maxLeftPairIndex != -1) {
        result = inputNumbers[maxLeftPairIndex]
    }

    return result
}

func generateRandomNumbers(amountOfNumbers: Int, maxNumber: Int) -> [Int64] {
    return Array(repeating: 2, count: Int.random(in: 2..<amountOfNumbers))
        .map {_ in Int.random(in: 0..<maxNumber)}
        .map { Int64($0) }
}

repeat {
    let input: [Int64] = generateRandomNumbers(amountOfNumbers: 10000, maxNumber: 200000)
    let brutforceResult = maxPairwiseProductBrutForce(inputNumbers: input)
    let optimziedResult = maxPairwiseProductOptimized(inputNumbers: input)
    let succeed = brutforceResult == optimziedResult
    
    if (!succeed) {
        fatalError("brutforce \(brutforceResult) != optimized \(optimziedResult) input \(input)")
    }
} while (true)

