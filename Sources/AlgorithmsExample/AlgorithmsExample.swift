import Algorithms

public enum AlgorithmsExample {
    public static func chunks(of values: [Int], size: Int) -> [[Int]] {
        values.chunks(ofCount: size).map(Array.init)
    }

    public static func uniqued<T: Hashable>(_ values: [T]) -> [T] {
        Array(values.uniqued())
    }
}
