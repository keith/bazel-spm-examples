import FacebookCore

public enum FacebookExample {
    public static func configure(
        appID: String,
        clientToken: String
    ) {
        Settings.shared.appID = appID
        Settings.shared.clientToken = clientToken
    }

    public static func sdkVersion() -> String {
        Settings.shared.sdkVersion
    }
}
