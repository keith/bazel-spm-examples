import Logging

public enum LogExample {
    public static func makeLogger(label: String) -> Logger {
        var logger = Logger(label: label)
        logger.logLevel = .info
        return logger
    }
}
