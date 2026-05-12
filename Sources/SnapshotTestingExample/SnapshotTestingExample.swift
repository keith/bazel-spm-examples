import SnapshotTesting

public struct SnapshotTestingExampleReceipt: Codable, Equatable {
    public var id: Int
    public var items: [String]
    public var totalCents: Int

    public init(id: Int, items: [String], totalCents: Int) {
        self.id = id
        self.items = items
        self.totalCents = totalCents
    }
}

public enum SnapshotTestingExample {
    public static let receipt = SnapshotTestingExampleReceipt(
        id: 42,
        items: [
            "Coffee",
            "Croissant",
        ],
        totalCents: 1250
    )

    public static var receiptSnapshot: Snapshotting<SnapshotTestingExampleReceipt, String> {
        .json
    }

    public static func assertReceiptSnapshot(
        record: Bool? = nil,
        fileID: StaticString = #fileID,
        file: StaticString = #filePath,
        testName: String = #function,
        line: UInt = #line,
        column: UInt = #column
    ) {
        assertSnapshot(
            of: receipt,
            as: receiptSnapshot,
            record: record,
            fileID: fileID,
            file: file,
            testName: testName,
            line: line,
            column: column
        )
    }
}
