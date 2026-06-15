// import opencv2
import OpenCVObjCBridgeModule

@main
struct OpenCVExample {
    static func main() {
        let summary = OpenCVObjCBridge.onePixelMatSummary()

        print(
            "OpenCV Mat rows=\(summary.rows) cols=\(summary.cols) type=\(summary.type)"
        )
    }
}
