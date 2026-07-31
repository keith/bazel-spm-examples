import AirshipCore

public enum AirshipExample {
    public static func makeConfiguration(
        appKey: String,
        appSecret: String
    ) -> AirshipConfig {
        var configuration = AirshipConfig()
        configuration.defaultAppKey = appKey
        configuration.defaultAppSecret = appSecret
        return configuration
    }
}
