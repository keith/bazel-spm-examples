import Alamofire
import Foundation

public enum AlamofireExample {
    public static func makeRequest(url: URL) -> DataRequest {
        AF.request(url)
    }
}
