//
//  ViewController.swift
//  Fifygram
//
//  Created by Alan Soares on 29/09/20.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let contex = CIContext()
    var original: UIImage?
    
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func choosePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            navigationController?.present(picker, animated: true, completion: nil)
        }
    }
    
    @IBAction func applySepia() {
        if original == nil {
            return
        }
        
        let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(0.5, forKey: kCIInputIntensityKey)
        display(filter: filter!)
        
    }
    
    @IBAction func applyNoip() {
        if original == nil {
            return
        }
        
        let filter = CIFilter(name: "CIPhotoEffectNoir")
        display(filter: filter!)
        
    }
    
    @IBAction func applyVintage() {
        if original == nil {
            return
        }
        
        let filter = CIFilter(name: "CIPhotoEffectProcess")
        display(filter: filter!)
    }
    
    func display(filter: CIFilter) -> Void {
        filter.setValue(CIImage(image: original!), forKey: kCIInputImageKey)
        let output = filter.outputImage
        imageView.image = UIImage(cgImage: self.contex.createCGImage(output!, from: output!.extent)!)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        navigationController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            original = image
        }
    }

}

