import Foundation
import IDLiveFaceIAD
import MiSnap
import MiSnapCore
import MiSnapFacialCapture
import MiSnapFacialCaptureUX
import MiSnapNFC
import MiSnapNFCUX
import MiSnapUX
import MiSnapVoiceCapture
import MiSnapVoiceCaptureUX

public enum MiSnapExample {
    public static func sha256(_ data: Data) -> String? {
        MiSnapCryptography.hash(data, algorithm: .sha256)
    }
}
