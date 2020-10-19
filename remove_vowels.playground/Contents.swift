///In a town, houses are marked with English alphabets. Committee in the town wants to renovate the houses. They decided to renovate only houses named with vowels. Committee has given the list to members and asks them to identify the houses which are not renovated. Write an algorithm to help the committee members to find houses which are not renovated.
///
///
///
///Input: Input to the function contains only one argument.
///House: A string representing the sequence of house markings.
///Output: return a string that represents the houses which were not renovated.

let vowels: [Character] = ["a", "A",
                           "e", "E",
                           "i", "I",
                           "o", "O",
                           "u", "U"];

func removeVowels(input: String) -> String {
  
  var result = ""
  var iterator = input.makeIterator()
  while let character = iterator.next() {
    if (!vowels.contains(character)) {
      result.append(character)
    }
  }
  
  return result
}

let inputString = "faceprep"
let expected = "fcprp"

let result = removeVowels(input: inputString)

if (result == expected) {
  print("succeed")
} else {
  print("failed result '\(result)' != expected '\(expected)'")
}
