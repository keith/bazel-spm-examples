import AsyncAlgorithms

public enum AsyncAlgorithmsExample {
    public static func zipped() async -> [(Int, String)] {
        let numbers = [1, 2, 3].async
        let words = ["one", "two", "three"].async
        var results: [(Int, String)] = []
        for await pair in zip(numbers, words) {
            results.append(pair)
        }
        return results
    }
}
