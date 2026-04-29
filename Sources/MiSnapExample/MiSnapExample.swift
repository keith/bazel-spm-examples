import Foundation
import MiSnapCore

public enum MiSnapExample {
    public static func sha256(_ data: Data) -> String? {
        MiSnapCryptography.hash(data, algorithm: .sha256)
    }
}
