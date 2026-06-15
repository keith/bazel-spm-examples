import Darwin
import Foundation
import XCTest

final class RevealExampleTests: XCTestCase {
    func testLoadsRevealServerAtRuntime() throws {
        let path = try XCTUnwrap(
            revealServerPath(),
            "RevealServer.framework was not bundled with the test"
        )

        let handle = dlopen(path, RTLD_NOW)
        XCTAssertNotNil(handle, dlopenErrorMessage())
    }

    private func revealServerPath() -> String? {
        let fileManager = FileManager.default
        let frameworkExecutable = "RevealServer.framework/RevealServer"
        let searchDirectories = [
            Bundle.main.privateFrameworksPath,
            Bundle(for: RevealExampleTests.self).privateFrameworksPath,
            Bundle.main.bundlePath + "/Frameworks",
            Bundle(for: RevealExampleTests.self).bundlePath + "/Frameworks",
        ].compactMap { $0 }

        for directory in searchDirectories {
            let path = (directory as NSString).appendingPathComponent(frameworkExecutable)
            if fileManager.fileExists(atPath: path) {
                return path
            }
        }

        return nil
    }

    private func dlopenErrorMessage() -> String {
        guard let error = dlerror() else {
            return "dlopen returned nil without an error"
        }

        return String(cString: error)
    }
}
