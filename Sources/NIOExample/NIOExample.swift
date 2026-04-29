import NIOCore
import NIOPosix

public enum NIOExample {
    public static func makeEventLoopGroup() -> EventLoopGroup {
        MultiThreadedEventLoopGroup(numberOfThreads: 1)
    }

    public static func roundTrip(value: Int, on group: EventLoopGroup) async throws -> Int {
        let promise = group.next().makePromise(of: Int.self)
        promise.succeed(value)
        return try await promise.futureResult.get()
    }
}
