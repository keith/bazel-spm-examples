import BrazeKit

public enum BrazeExample {
    public static func makeConfiguration(
        apiKey: String,
        endpoint: String
    ) -> Braze.Configuration {
        Braze.Configuration(
            apiKey: apiKey,
            endpoint: endpoint
        )
    }

    public static func makeBraze(
        apiKey: String,
        endpoint: String
    ) -> Braze {
        Braze(
            configuration: makeConfiguration(
                apiKey: apiKey,
                endpoint: endpoint
            )
        )
    }
}
