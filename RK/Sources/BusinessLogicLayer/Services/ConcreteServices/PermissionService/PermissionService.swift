//
// Created by Юрий Трыков on 28.05.2020.
//

import Foundation
import AVFoundation

protocol PermissionServiceType {

    var haveCameraPermission: Bool { get }

    func requestCameraPermission(_ completionHandler: @escaping (Bool) -> Void)
}

class PermissionService: PermissionServiceType {

    let haveCameraPermission: Bool = AVCaptureDevice.authorizationStatus(for: .video) == .authorized

    func requestCameraPermission(_ completionHandler: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { result in
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }
    }
}
