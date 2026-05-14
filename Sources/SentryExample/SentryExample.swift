import Sentry

public enum SentryExample {
    public static func makeId() -> SentryId {
        SentryId()
    }

    public static func emptyIdString() -> String {
        SentryId.empty.sentryIdString
    }
}
