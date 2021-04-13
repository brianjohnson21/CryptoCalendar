//
//  ImageUploader.swift
//  GDJ
//
//  Created by Dylan Reich on 1/4/20.
//  Copyright © 2019 Dylan. All rights reserved.
//

import Foundation
import UIKit
import AWSS3
import AWSCore
import Disk
import MobileCoreServices
import AVKit

protocol ImageUploaderDelegate {
    func updateImageProgress(progressPercentage: Double)
}

class ImageUploader {
    
    static var delegate: ImageUploaderDelegate?
    
    static var indicatorProgress: Double = 0
    
    static func uploadImage(image: UIImage, keyName: String, completion: @escaping (Error?, Bool, String) -> ()) {
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.setValue("public-read", forRequestHeader: "x-amz-acl")

        let progressBlock: AWSS3TransferUtilityProgressBlock = {(task, progress) in
            DispatchQueue.main.async(execute: {
                print("\(progress.fractionCompleted) - 🔥🔥🔥")
                
                
                
                //indicatorProgress
                //delegate.imageIsUploading()
                delegate?.updateImageProgress(progressPercentage: progress.fractionCompleted)
                
                indicatorProgress = progress.fractionCompleted
                
                
            })
        }
        
        expression.progressBlock = progressBlock
        
        //        DispatchQueue.main.async(execute: {
        //            self.statusLabel.text = ""
        //            self.progressView.progress = 0
        //        })
        
        guard let data = image.jpegData(compressionQuality: 0.75) else {
            print("couldn't convert image to data")
            return
        }
        
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USWest2, identityPoolId: "us-west-2:972eeb81-e8c6-4848-b9e3-49d33e820fbc")
        let serviceConfiguration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)// AWSServiceManager.default().defaultServiceConfiguration
        let transferUtilityConfiguration = AWSS3TransferUtilityConfiguration()
        transferUtilityConfiguration.bucket = "cryptocalbucket"
        
        AWSS3TransferUtility.register(
            with: serviceConfiguration!,
            transferUtilityConfiguration: transferUtilityConfiguration,
            forKey: keyName
        )
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: keyName)
        
        let completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock = { (task, error) -> Void in
            DispatchQueue.main.async(execute: {
                if let error = error {
                    print("Failed with error: \(error)")
                    AWSS3TransferUtility.remove(forKey: keyName)
                    completion(error, false, "")
                    return
                    //                    self.statusLabel.text = "Failed"
                }
                //                else if(self.progressView.progress != 1.0) {
                //                    self.statusLabel.text = "Failed"
                //                    NSLog("Error: Failed - Likely due to invalid region / filename")
                //                }
                //                else{
                //                    self.statusLabel.text = "Success"
                //                }
                
                let url = AWSS3.default().configuration.endpoint.url // serviceConfiguration!.endpoint.url
                let publicURL = url?.appendingPathComponent(task.bucket).appendingPathComponent(keyName)
                if let absoluteString = publicURL?.absoluteString {
                    print("Uploaded to:\(absoluteString)")
                    AWSS3TransferUtility.remove(forKey: keyName)
                    completion(nil, true, absoluteString)
                } else {
                    AWSS3TransferUtility.remove(forKey: keyName)
                    completion(nil, false, "")
                }
                
            })
        }
        
        transferUtility!.uploadData(
            data,
            key: keyName,
            contentType: "image/jpeg",
            expression: expression,
            completionHandler: completionHandler).continueWith { (task) -> AnyObject? in
                if let error = task.error {
                    print("Error: \(error.localizedDescription)")
                    
                    //                    DispatchQueue.main.async {
                    //                        self.statusLabel.text = "Failed"
                    //                    }
                }
                
                if let _ = task.result {
                    
                    //                    DispatchQueue.main.async {
                    //                        self.statusLabel.text = "Uploading..."
                    //                        print("Upload Starting!")
                    //                    }
                    
                    // Do something with uploadTask.
                }
                
                return nil; //why does amazon have semicolons in their example from 2018
        }
    }
    
    static func uploadVideoThumbnailImage(key: String, image: UIImage, completion: @escaping (Error?, Bool, String) -> ()) {
            let expression = AWSS3TransferUtilityUploadExpression()
            expression.setValue("public-read", forRequestHeader: "x-amz-acl")

            let progressBlock: AWSS3TransferUtilityProgressBlock = {(task, progress) in
                DispatchQueue.main.async(execute: {
                    print("\(progress.fractionCompleted) - 🔥🔥🔥")
                    
                    
                    
                    //indicatorProgress
                    //delegate.imageIsUploading()
                    delegate?.updateImageProgress(progressPercentage: progress.fractionCompleted)
                    
                    indicatorProgress = progress.fractionCompleted
                    
                    
                })
            }
            
            expression.progressBlock = progressBlock
            
            //        DispatchQueue.main.async(execute: {
            //            self.statusLabel.text = ""
            //            self.progressView.progress = 0
            //        })
            
            guard let data = image.jpegData(compressionQuality: 0.75) else {
                print("couldn't convert image to data")
                return
            }
            
            let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USWest2, identityPoolId: "us-west-2:972eeb81-e8c6-4848-b9e3-49d33e820fbc")
            let serviceConfiguration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)// AWSServiceManager.default().defaultServiceConfiguration
            let transferUtilityConfiguration = AWSS3TransferUtilityConfiguration()
            transferUtilityConfiguration.bucket = "cryptocalbucket"
            
            let keyName = "thumbnailforvideokey\(key)"

            AWSS3TransferUtility.register(
                with: serviceConfiguration!,
                transferUtilityConfiguration: transferUtilityConfiguration,
                forKey: keyName
            )
            
            let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: keyName)
                    
            let completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock = { (task, error) -> Void in
                DispatchQueue.main.async(execute: {
                    if let error = error {
                        print("Failed with error: \(error)")
                        AWSS3TransferUtility.remove(forKey: keyName)
                        completion(error, false, "")
                        return
                        //                    self.statusLabel.text = "Failed"
                    }
                    //                else if(self.progressView.progress != 1.0) {
                    //                    self.statusLabel.text = "Failed"
                    //                    NSLog("Error: Failed - Likely due to invalid region / filename")
                    //                }
                    //                else{
                    //                    self.statusLabel.text = "Success"
                    //                }
                    
                    let url = AWSS3.default().configuration.endpoint.url // serviceConfiguration!.endpoint.url
                    let publicURL = url?.appendingPathComponent(task.bucket).appendingPathComponent(keyName)
                    if let absoluteString = publicURL?.absoluteString {
                        print("Uploaded to:\(absoluteString)")
                        AWSS3TransferUtility.remove(forKey: keyName)
                        completion(nil, true, absoluteString)
                    } else {
                        AWSS3TransferUtility.remove(forKey: keyName)
                        completion(nil, false, "")
                    }
                    
                })
            }
            
            transferUtility!.uploadData(
                data,
                key: keyName,
                contentType: "image/jpeg",
                expression: expression,
                completionHandler: completionHandler).continueWith { (task) -> AnyObject? in
                    if let error = task.error {
                        print("Error: \(error.localizedDescription)")
                        
                        //                    DispatchQueue.main.async {
                        //                        self.statusLabel.text = "Failed"
                        //                    }
                    }
                    
                    if let _ = task.result {
                        
                        //                    DispatchQueue.main.async {
                        //                        self.statusLabel.text = "Uploading..."
                        //                        print("Upload Starting!")
                        //                    }
                        
                        // Do something with uploadTask.
                    }
                    
                    return nil; //why does amazon have semicolons in their example from 2018
            }
        }
        
    static func uploadVideoForuser(video: URL, thumbnail: UIImage? = nil, completion: @escaping (Error?, Bool, String, String) -> ()) {
            let expression = AWSS3TransferUtilityUploadExpression()
            expression.setValue("public-read", forRequestHeader: "x-amz-acl")

            let progressBlock: AWSS3TransferUtilityProgressBlock = {(task, progress) in
                DispatchQueue.main.async(execute: {
                    print("\(progress.fractionCompleted) - 🔥🔥🔥")
                    
                    
                    
                    //indicatorProgress
                    //delegate.imageIsUploading()
                    delegate?.updateImageProgress(progressPercentage: progress.fractionCompleted)
                    
                    indicatorProgress = progress.fractionCompleted
                    
                    
                })
            }
            
            expression.progressBlock = progressBlock
            
            //        DispatchQueue.main.async(execute: {
            //            self.statusLabel.text = ""
            //            self.progressView.progress = 0
            //        })
            
    //        guard let data = image.jpegData(compressionQuality: 0.75) else {
    //            print("couldn't convert image to data")
    //            return
    //        }
            
            let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USWest2, identityPoolId: "us-west-2:972eeb81-e8c6-4848-b9e3-49d33e820fbc")
            let serviceConfiguration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)// AWSServiceManager.default().defaultServiceConfiguration
            let transferUtilityConfiguration = AWSS3TransferUtilityConfiguration()
            transferUtilityConfiguration.bucket = "cryptocalbucket"
            
            guard let id = User.current.id?.uuidString else { return }
            
            AWSS3TransferUtility.register(
                with: serviceConfiguration!,
                transferUtilityConfiguration: transferUtilityConfiguration,
                forKey: "user\(id)profilevideo"
            )
            
            let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "user\(id)profilevideo")
            
            var keyName = "user\(id)profilevideo" // "postErrorKey"
//            do {
//                let posts = try Disk.retrieve("class\(classId)posts", from: .caches, as: [Post].self)
//                keyName = "Instructor\(Instructor.current.id)postVideo\(posts.count)"
//            } catch {
//                print(error)
//            }
            
            let completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock = { (task, error) -> Void in
                DispatchQueue.main.async(execute: {
                    if let error = error {
                        print("Failed with error: \(error)")
                        AWSS3TransferUtility.remove(forKey: keyName)
                        completion(error, false, "", "")
                        return
                        //                    self.statusLabel.text = "Failed"
                    }
                    //                else if(self.progressView.progress != 1.0) {
                    //                    self.statusLabel.text = "Failed"
                    //                    NSLog("Error: Failed - Likely due to invalid region / filename")
                    //                }
                    //                else{
                    //                    self.statusLabel.text = "Success"
                    //                }
                    
                    
                    let url = AWSS3.default().configuration.endpoint.url // serviceConfiguration!.endpoint.url
                    let publicURL = url?.appendingPathComponent(task.bucket).appendingPathComponent(keyName)
                    
                    if let videoUrl = publicURL?.absoluteString {
                        print("Uploaded to:\(videoUrl)")
                        
                        if let thumbnail = thumbnail {
                            ImageUploader.uploadVideoThumbnailImage(key: keyName, image: thumbnail) { (error, success, url) in
                                if let error = error {
                                    print(error)
                                    AWSS3TransferUtility.remove(forKey: keyName)
                                    completion(error, false, "", "")
                                    return
                                }
                                
                                guard success else {
                                    print("upload failed")
                                    AWSS3TransferUtility.remove(forKey: keyName)
                                    completion(nil, false, "", "")
                                    return
                                }
                                
                                AWSS3TransferUtility.remove(forKey: keyName)
                                completion(nil, true, videoUrl, url)
                            }
                        } else {
                            getThumbnailFromUrl(video) { (image) in
                                guard let image = image else {
                                    print("error getting thumbnail image")
                                    return
                                }
                                ImageUploader.uploadVideoThumbnailImage(key: keyName, image: image) { (error, success, url) in
                                    if let error = error {
                                        print(error)
                                        AWSS3TransferUtility.remove(forKey: keyName)
                                        completion(error, false, "", "")
                                        return
                                    }
                                    
                                    guard success else {
                                        print("upload failed")
                                        AWSS3TransferUtility.remove(forKey: keyName)
                                        completion(nil, false, "", "")
                                        return
                                    }
                                    
                                    AWSS3TransferUtility.remove(forKey: keyName)
                                    completion(nil, true, videoUrl, url)
                                }
                            }
                        }
                    } else {
                        AWSS3TransferUtility.remove(forKey: keyName)
                        completion(nil, false, "", "")
                    }
                })
            }
            
            transferUtility!.uploadFile(video, key: keyName, contentType: video.mimeType(), expression: expression, completionHandler: completionHandler).continueWith { (task) -> AnyObject? in
                    if let error = task.error {
                        print("Error: \(error.localizedDescription)")
                        
                        //                    DispatchQueue.main.async {
                        //                        self.statusLabel.text = "Failed"
                        //                    }
                    }
                    
                    if let _ = task.result {
                        
                        //                    DispatchQueue.main.async {
                        //                        self.statusLabel.text = "Uploading..."
                        //                        print("Upload Starting!")
                        //                    }
                        
                        // Do something with uploadTask.
                    }
                    
                    return nil; //why does amazon have semicolons in their example from 2018
            }
        }
    
    static func getThumbnailFromUrl(_ url: URL, _ completion: @escaping ((_ image: UIImage?)->Void)) {
        DispatchQueue.main.async {
            let asset = AVAsset(url: url)
            let assetImgGenerate = AVAssetImageGenerator(asset: asset)
            assetImgGenerate.appliesPreferredTrackTransform = true

            let time = CMTimeMake(value: 2, timescale: 1)
            do {
                let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
                let thumbnail = UIImage(cgImage: img)
                completion(thumbnail)
            } catch {
                print("Error :: ", error.localizedDescription)
                completion(nil)
            }
        }
    }
    
}

class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var picker = UIImagePickerController();
    var alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage?) -> ())?;
    
    override init(){
        super.init()
    }
    
    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage?) -> ())) {
        pickImageCallback = callback;
        self.viewController = viewController;
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallery", style: .default){
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }
        
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true, completion: nil)
    }
    func openCamera(){
        alert.dismiss(animated: true, completion: nil)
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        } else {
            let alertWarning = UIAlertView(title:"Warning", message: "You don't have camera", delegate:nil, cancelButtonTitle:"OK", otherButtonTitles:"")
            alertWarning.show()
        }
    }
    func openGallery(){
        alert.dismiss(animated: true, completion: nil)
        picker.sourceType = .photoLibrary
        self.viewController!.present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("error getting image from picker")
            pickImageCallback?(nil)
            return
        }
        pickImageCallback?(image)
    }
    
    //  // For Swift 4.2
    //  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    //      picker.dismiss(animated: true, completion: nil)
    //      guard let image = info[.originalImage] as? UIImage else {
    //          fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
    //      }
    //      pickImageCallback?(image)
    //  }
    
    
    
    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
    }
    
}

extension URL {
    func mimeType() -> String {
        let pathExtension = self.pathExtension
        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as NSString, nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                return mimetype as String
            }
        }
        return "application/octet-stream"
    }
    var containsImage: Bool {
        let mimeType = self.mimeType()
        guard let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, mimeType as CFString, nil)?.takeRetainedValue() else {
            return false
        }
        return UTTypeConformsTo(uti, kUTTypeImage)
    }
    var containsAudio: Bool {
        let mimeType = self.mimeType()
        guard let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, mimeType as CFString, nil)?.takeRetainedValue() else {
            return false
        }
        return UTTypeConformsTo(uti, kUTTypeAudio)
    }
    var containsVideo: Bool {
        let mimeType = self.mimeType()
        guard  let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, mimeType as CFString, nil)?.takeRetainedValue() else {
            return false
        }
        return UTTypeConformsTo(uti, kUTTypeMovie)
    }

}
