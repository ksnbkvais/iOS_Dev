func hasUniqueCharacters(_ text: String) -> Bool {
    var seenCharacters: Set<Character> = []
        for char in text {
        if seenCharacters.contains(char) {
            return false
        }
        seenCharacters.insert(char)
    }
    return true
}

print(hasUniqueCharacters("Hello"))
print(hasUniqueCharacters("World"))
