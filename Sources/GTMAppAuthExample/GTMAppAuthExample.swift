import GTMAppAuth

public enum GTMAppAuthExample {
    public static func makeKeychainStore(itemName: String) -> KeychainStore {
        KeychainStore(itemName: itemName)
    }
}
