import SwiftParser
import SwiftSyntax

public enum SwiftSyntaxExample {
    public static func functionNames(in source: String) -> [String] {
        let tree = Parser.parse(source: source)
        let collector = FunctionNameCollector()
        collector.walk(tree)
        return collector.names
    }
}

private final class FunctionNameCollector: SyntaxVisitor {
    var names: [String] = []

    init() {
        super.init(viewMode: .sourceAccurate)
    }

    override func visit(_ node: FunctionDeclSyntax) -> SyntaxVisitorContinueKind {
        names.append(node.name.text)
        return .visitChildren
    }
}
