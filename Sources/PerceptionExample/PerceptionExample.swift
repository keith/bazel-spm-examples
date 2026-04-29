import Perception

@Perceptible
public final class Counter {
    public var count: Int

    public init(count: Int = 0) {
        self.count = count
    }

    public func increment() {
        count += 1
    }
}
