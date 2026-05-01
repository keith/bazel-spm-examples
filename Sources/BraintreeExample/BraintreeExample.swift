import BraintreeCard

public enum BraintreeExample {
    public static func makeCard(
        number: String,
        expirationMonth: String,
        expirationYear: String,
        cvv: String
    ) -> BTCard {
        BTCard(
            number: number,
            expirationMonth: expirationMonth,
            expirationYear: expirationYear,
            cvv: cvv
        )
    }
}
