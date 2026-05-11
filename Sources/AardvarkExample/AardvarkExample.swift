import Aardvark
import Foundation

public enum AardvarkExample {
    public static func makeAttachment(
        fileName: String,
        data: Data,
        mimeType: String
    ) -> ARKBugReportAttachment {
        ARKBugReportAttachment(
            fileName: fileName,
            data: data,
            dataMIMEType: mimeType
        )
    }
}
