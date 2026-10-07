import YotiDocumentScan

public enum YotiDocumentScanExample {
    public static func country(alpha2: String, alpha3: String) -> YotiDocumentScanCountry {
        YotiDocumentScanCountry(alpha2: alpha2, alpha3: alpha3)
    }
}
