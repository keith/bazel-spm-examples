import ArgumentParser

public struct Greet: ParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "greet",
        abstract: "Print a greeting."
    )

    @Option(name: .shortAndLong, help: "Who to greet.")
    public var name: String = "world"

    @Flag(name: .shortAndLong, help: "Shout the greeting.")
    public var loud: Bool = false

    public init() {}

    public func run() throws {
        let message = "Hello, \(name)!"
        print(loud ? message.uppercased() : message)
    }
}
