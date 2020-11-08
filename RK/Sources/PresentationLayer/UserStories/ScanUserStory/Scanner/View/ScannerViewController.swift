//
// Created by Юрий Трыков on 28.05.2020.
//

import Foundation
import AVFoundation
import UIKit
import Combine

protocol ScannerViewControllerDelegate: class {
    func barCode(_ value: String)
}
class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    let permissionService = MainAssembler.shared.resolve(PermissionServiceType.self)
    weak var delegate: ScannerViewControllerDelegate?
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = R.image.temp_image_overlay()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var preview: UIView = UIView()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.text = R.string.localizable.scannerTitle()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var permissionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = R.color.gray()
        label.text = R.string.localizable.scannerPermissionCameraMessage()
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var closeButton: UIButton = { [unowned self] in
        let button = UIButton()
        button.setImage(R.image.close(), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTrigger), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        askPermission()
        setupScanner()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if captureSession?.isRunning == false {
            captureSession.startRunning()
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if captureSession?.isRunning == true {
            captureSession.stopRunning()
        }
    }

    private func configureUI() {
        view.addSubview(preview)
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(permissionLabel)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            preview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            preview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            preview.topAnchor.constraint(equalTo: view.topAnchor),
            preview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            permissionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            permissionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            closeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        view.backgroundColor = UIColor.black
    }
    func askPermission() {
        permissionService.requestCameraPermission { [weak self] havePermission in
            guard !havePermission,
                  let alert = self?.permissionAlert() else {
                return
            }
            self?.permissionLabel.isHidden = false
            self?.present(alert, animated: true)
        }
    }
    func setupScanner() {
        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            return
        }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }

        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417]
        } else {
            failed()
            return
        }

        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        preview.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }
    func failed() {
        let ac = UIAlertController(title: R.string.localizable.scannerErrorTitle(),
                message: R.string.localizable.scannerErrorDescription(), preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: R.string.localizable.ok(), style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    func permissionAlert() -> UIAlertController {
        let alert = UIAlertController(
                title: R.string.localizable.scannerPermissionCameraTitle(),
                message: R.string.localizable.scannerPermissionCameraMessage(),
                preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: R.string.localizable.scannerPermissionAllow(),
                style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            UIApplication.shared.open(settingsUrl)
        }
        let cancelAction = UIAlertAction(title: R.string.localizable.cancel(),
                style: .cancel)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        return alert
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        captureSession.stopRunning()

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else {
                return
            }
            guard let stringValue = readableObject.stringValue else {
                return
            }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }

        dismiss(animated: true)
    }

    func found(code: String) {
        delegate?.barCode(code)
    }

    @objc func closeButtonTrigger(sender: UIButton) {
        dismiss(animated: true)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
