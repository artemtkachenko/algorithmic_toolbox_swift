
/// https://leetcode.com/problems/jewels-and-stones/


class Solution {
  func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var numberOfJewels: Int = 0
    var iterator = S.makeIterator();
    while let next = iterator.next() {
      if (J.contains(next)) {
        numberOfJewels += 1;
      }
    }
    
    print("numberOfJewels = \(numberOfJewels)")
    return numberOfJewels
  }
}
