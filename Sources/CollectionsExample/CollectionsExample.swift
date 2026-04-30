import Collections

public enum CollectionsExample {
    public static func makeDeque(_ values: [Int]) -> Deque<Int> {
        var deque = Deque<Int>()
        for value in values {
            deque.append(value)
        }
        return deque
    }

    public static func ordered<Key: Hashable, Value>(
        _ pairs: [(Key, Value)]
    ) -> OrderedDictionary<Key, Value> {
        var result: OrderedDictionary<Key, Value> = [:]
        for (key, value) in pairs {
            result[key] = value
        }
        return result
    }
}
