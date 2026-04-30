import Crypto
import Foundation

public enum CryptoExample {
    public static func sha256(_ data: Data) -> String {
        let digest = SHA256.hash(data: data)
        return digest.map { String(format: "%02x", $0) }.joined()
    }

    public static func hmac(message: Data, key: SymmetricKey) -> Data {
        let mac = HMAC<SHA256>.authenticationCode(for: message, using: key)
        return Data(mac)
    }
}
