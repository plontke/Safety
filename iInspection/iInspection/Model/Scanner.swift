//
//  Scanner.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-28.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit
import AVFoundation

class Scanner: NSObject {
    private var viewController: UIViewController
    private var captureSession: AVCaptureSession?
    private var codeOutputHandler: (_ code:String) -> Void
    
    init(withViewController viewController: UIViewController, view: UIView, codeOutputHandler: @escaping (String) -> Void){
        self.viewController = viewController
        self.codeOutputHandler = codeOutputHandler
        super.init()
        if let captureSession = self.createCaptureSession()
        {
            self.captureSession = captureSession
            let previewLayer = self.createPreviewLayer(withCaptureSession: captureSession, view: view)
            view.layer.addSublayer(previewLayer)
        }
    }
    
    private func createCaptureSession() -> AVCaptureSession?{
        let captureSession = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            return nil
        }
        
        
        let deviceInput = try? AVCaptureDeviceInput(device: captureDevice)
        let metaDataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddInput(deviceInput!){
            captureSession.addInput(deviceInput!)
        }else {
            return nil
        }
        if captureSession.canAddOutput(metaDataOutput){
            captureSession.addOutput(metaDataOutput)
            if let viewController = self.viewController as? AVCaptureMetadataOutputObjectsDelegate{
                metaDataOutput.setMetadataObjectsDelegate(viewController, queue: DispatchQueue.main)
            }
        }
        else {
            return nil
        }
        return captureSession
    }
    
    
    
    
    private func createPreviewLayer(withCaptureSession captureSesson: AVCaptureSession, view: UIView) -> AVCaptureVideoPreviewLayer {
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSesson)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        return previewLayer
    }
    
    func requestCaptureSessionStartRunning(){
        guard let captureSession = self.captureSession else {
            return
        }
        if !captureSession.isRunning{
            captureSession.startRunning()
        }
    }
    
    func requestCaptureSessionStopRunning() {
        guard let captureSession = self.captureSession else{
            return
        }
        if captureSession.isRunning{
            captureSession.stopRunning()
        }
    }
    func scannerDelegate(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection){
        // when scan is made
        self.requestCaptureSessionStopRunning()
        guard let readableObject = metadataObjects as? AVMetadataMachineReadableCodeObject else {
            return
        }
        guard let stringValue = readableObject.stringValue else {
            return
        }
        self.codeOutputHandler(stringValue)
    }
}
