//
//  View2.swift
//  Hunt Me If You Can
//
//  Created by Dung Nguyen Tien on 7/15/16.
//  Copyright © 2016 David T. Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

class View2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    
    
    @IBOutlet weak var cameraView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer!.frame = cameraView.bounds
    }
    
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        var backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        
        var error : NSError?
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            
            if (error == nil && captureSession?.canAddInput(input) != nil) {
                captureSession?.addInput(input)
            
                stillImageOutput = AVCaptureStillImageOutput()
                stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
                if (captureSession?.canAddOutput(stillImageOutput) != nil) {
                
                    captureSession?.addOutput(stillImageOutput)
                
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                    previewLayer!.videoGravity = AVLayerVideoGravityResizeAspect
                    previewLayer!.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                    cameraView.layer.addSublayer(previewLayer!)
                    captureSession?.startRunning()
                
                    }
            
            }
        } catch {
            
        }
        
    }
    
}
