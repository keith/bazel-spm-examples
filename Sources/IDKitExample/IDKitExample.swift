import IDKit

public enum IDKitExample {
    public static var sdkVersion: String {
        IDKit.version
    }

    public static func hashSignal(_ signal: String) -> String {
        IDKit.hashSignal(signal)
    }

    public static func makeRequestConfig(
        appID: String,
        action: String,
        rpContext: RpContext,
        actionDescription: String? = "Verify Humanity",
        returnTo: String? = nil,
        environment: Environment = .staging
    ) -> IDKitRequestConfig {
        IDKitRequestConfig(
            appId: appID,
            action: action,
            rpContext: rpContext,
            actionDescription: actionDescription,
            bridgeUrl: nil,
            allowLegacyProofs: true,
            overrideConnectBaseUrl: nil,
            returnTo: returnTo,
            environment: environment,
            connectUrlMode: nil
        )
    }

    public static func makeRpContext(
        rpID: String,
        nonce: String,
        createdAt: UInt64,
        expiresAt: UInt64,
        signature: String
    ) throws -> RpContext {
        try RpContext(
            rpId: rpID,
            nonce: nonce,
            createdAt: createdAt,
            expiresAt: expiresAt,
            signature: signature
        )
    }

    public static func makeVerificationPreset(signal: String? = nil) -> Preset {
        orbLegacy(signal: signal)
    }
}
