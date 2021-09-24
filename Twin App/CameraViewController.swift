//
//  CameraViewController.swift
//  CameraViewController
//
//  Created by Anubhav Das on 23/09/21.
//

import UIKit
import CoreML
import Vision
import AVFoundation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var wastelabel: UILabel!
    @IBOutlet weak var gifImg: UIImageView!
    //    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet var addItemView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgViewBig: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    var shareIMG: String! = nil
    var shareIMG2: String! = nil
    var shareLabel: String! = nil
    var shareML: String! = nil
    
    //    var url = URL(string: "DC1")!
    
    //    var effect:UIVisualEffect!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        
        let image1 = UIImage(named: shareIMG)
        imgViewBig.image = image1
        let image2 = UIImage(named: shareIMG2)
        imgView.image = image2
        movieLabel.text = shareLabel
        //        url = URL(string: shareML)!
        
        self.imgView.layer.cornerRadius = 10
        
    }
    
    func animateIn() {
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            //            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
        
    }
    
    func animateOut () {
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            //            self.visualEffectView.effect = nil
            
            
        }) { (success:Bool) in
            self.addItemView.removeFromSuperview()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgView.image = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert to CIImage")
            }
            
            detect(image: ciimage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    func detect(image: CIImage) {
        
        if(shareML == "DC1"){
            
            guard let model = try? VNCoreMLModel(for: DC1().model) else {
                fatalError("Loading CoreMl model failed")
            }
            
            let request = VNCoreMLRequest(model: model) { (request, error) in
                guard let results = request.results as? [VNClassificationObservation] else {
                    fatalError("Model failed to process image")
                }
                
                if let firstResult = results.first {
                    if firstResult.identifier.contains("Amen"){
                        self.gifImg.image = UIImage(imageLiteralResourceName: "aqua.JPG")
                        self.wastelabel.text = "Aquaman is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "YE.png")
                        self.readMe(myText: "Aquaman is your Look Alike")
                        
                    }
                    if firstResult.identifier.contains("Bman") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "bat.JPG")
                        self.wastelabel.text = "Batman is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "RE.png")
                        self.readMe(myText: "Batman is your Look Alike")
                    }
                    if firstResult.identifier.contains("Flash") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "flash.JPG")
                        self.wastelabel.text = "Flash is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "OR.png")
                        self.readMe(myText: "Flash is your Look Alike")
                    }
                    if firstResult.identifier.contains("Sman") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "super.JPG")
                        self.wastelabel.text = "Superman is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BL.png")
                        self.readMe(myText: "Superman is your Look Alike")
                    }
                    if firstResult.identifier.contains("Victor") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "victor.JPG")
                        self.wastelabel.text = "Victor Stone is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "GR.png")
                        self.readMe(myText: "Victor Stone is your Look Alike")
                    }
                    if firstResult.identifier.contains("Wmen") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "wonder.JPG")
                        self.wastelabel.text = "Wonder Woman is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Wonder Woman is your Look Alike")
                    }
                }
                
                print(results)
            }
            
            let handler = VNImageRequestHandler(ciImage: image)
            
            do {
                try handler.perform([request])
            }
            catch {
                print(error)
            }
            
            animateIn()
            
        }
        
        if(shareML == "Narnia1"){
            
            guard let model = try? VNCoreMLModel(for: Narnia1().model) else {
                fatalError("Loading CoreMl model failed")
            }
            
            let request = VNCoreMLRequest(model: model) { (request, error) in
                guard let results = request.results as? [VNClassificationObservation] else {
                    fatalError("Model failed to process image")
                }
                
                if let firstResult = results.first {
                    if firstResult.identifier.contains("AslanTR"){
                        self.gifImg.image = UIImage(imageLiteralResourceName: "lion.JPG")
                        self.wastelabel.text = "Aslan is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "YE.png")
                        self.readMe(myText: "Aslan is your Look Alike")
                        
                    }
                    if firstResult.identifier.contains("EdmTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "edmund.JPG")
                        self.wastelabel.text = "Edmund Pevensie is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "RE.png")
                        self.readMe(myText: "Edmund Pevensie is your Look Alike")
                    }
                    if firstResult.identifier.contains("EusTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "eus.JPG")
                        self.wastelabel.text = "Eustace Scrubb is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "OR.png")
                        self.readMe(myText: "Eustace Scrubb is your Look Alike")
                    }
                    if firstResult.identifier.contains("IceTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "ice.JPG")
                        self.wastelabel.text = "Jadis the White Witch is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BL.png")
                        self.readMe(myText: "Jadis the White Witch is your Look Alike")
                    }
                    if firstResult.identifier.contains("LucyTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "lucy.JPG")
                        self.wastelabel.text = "Lucy Pevensie is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "GR.png")
                        self.readMe(myText: "Lucy Pevensie is your Look Alike")
                    }
                    if firstResult.identifier.contains("PeterTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "peter.JPG")
                        self.wastelabel.text = "Peter Pevensie is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Peter Pevensie is your Look Alike")
                    }
                    if firstResult.identifier.contains("PrinceTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "prince.JPG")
                        self.wastelabel.text = "Prince Caspian is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Prince Caspian is your Look Alike")
                    }
                    if firstResult.identifier.contains("SusTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "susan.JPG")
                        self.wastelabel.text = "Susan Pevensie is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Susan Pevensie is your Look Alike")
                    }
                    if firstResult.identifier.contains("TumnusTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "tum.JPG")
                        self.wastelabel.text = "Mr. Tumnus is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Mr. Tumnus is your Look Alike")
                    }
                }
                
                print(results)
            }
            
            let handler = VNImageRequestHandler(ciImage: image)
            
            do {
                try handler.perform([request])
            }
            catch {
                print(error)
            }
            
            animateIn()
            
        }
        
        if(shareML == "FB1"){
            
            guard let model = try? VNCoreMLModel(for: FB1().model) else {
                fatalError("Loading CoreMl model failed")
            }
            
            let request = VNCoreMLRequest(model: model) { (request, error) in
                guard let results = request.results as? [VNClassificationObservation] else {
                    fatalError("Model failed to process image")
                }
                
                if let firstResult = results.first {
                    if firstResult.identifier.contains("CredTR"){
                        self.gifImg.image = UIImage(imageLiteralResourceName: "cred.JPG")
                        self.wastelabel.text = "Credence Barebone is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "YE.png")
                        self.readMe(myText: "Credence Barebone is your Look Alike")
                        
                    }
                    if firstResult.identifier.contains("DumbTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "dumble.JPG")
                        self.wastelabel.text = "Albus Percival Wulfric Brian Dumbledore is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "RE.png")
                        self.readMe(myText: "Albus Percival Wulfric Brian Dumbledore is your Look Alike")
                    }
                    if firstResult.identifier.contains("GrindTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "grind.JPG")
                        self.wastelabel.text = "Gellert Grindelwald is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "OR.png")
                        self.readMe(myText: "Gellert Grindelwald is your Look Alike")
                    }
                    if firstResult.identifier.contains("JacobTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "jacob.JPG")
                        self.wastelabel.text = "Jacob Kowalski is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BL.png")
                        self.readMe(myText: "Jacob Kowalski is your Look Alike")
                    }
                    if firstResult.identifier.contains("LetaTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "leta.JPG")
                        self.wastelabel.text = "Leta Lestrange is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "GR.png")
                        self.readMe(myText: "Leta Lestrange is your Look Alike")
                    }
                    if firstResult.identifier.contains("NaginiTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "nagin.JPG")
                        self.wastelabel.text = "Nagini is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Nagini is your Look Alike")
                    }
                    if firstResult.identifier.contains("NewtTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "newt.JPG")
                        self.wastelabel.text = "Newt Scamander is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Newt Scamander is your Look Alike")
                    }
                    if firstResult.identifier.contains("PorpentTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "porp.JPG")
                        self.wastelabel.text = "Porpentina Goldstein is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Porpentina Goldstein is your Look Alike")
                    }
                    if firstResult.identifier.contains("QueenTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "queen.JPG")
                        self.wastelabel.text = "Queenie Goldstein is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Queenie Goldstein is your Look Alike")
                    }
                    if firstResult.identifier.contains("ThesTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "thes.JPG")
                        self.wastelabel.text = "Theseus Scamander is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Theseus Scamander is your Look Alike")
                    }
                }
                
                print(results)
            }
            
            let handler = VNImageRequestHandler(ciImage: image)
            
            do {
                try handler.perform([request])
            }
            catch {
                print(error)
            }
            
            animateIn()
            
        }
        
        if(shareML == "X1"){
            
            guard let model = try? VNCoreMLModel(for: X1().model) else {
                fatalError("Loading CoreMl model failed")
            }
            
            let request = VNCoreMLRequest(model: model) { (request, error) in
                guard let results = request.results as? [VNClassificationObservation] else {
                    fatalError("Model failed to process image")
                }
                
                if let firstResult = results.first {
                    if firstResult.identifier.contains("BeastTR"){
                        self.gifImg.image = UIImage(imageLiteralResourceName: "beastx.JPG")
                        self.wastelabel.text = "Nicholas Hoult is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "YE.png")
                        self.readMe(myText: "Nicholas Hoult is your Look Alike")
                        
                    }
                    if firstResult.identifier.contains("CyclTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "cyclo.JPG")
                        self.wastelabel.text = "Cyclops is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "RE.png")
                        self.readMe(myText: "Cyclops is your Look Alike")
                    }
                    if firstResult.identifier.contains("FlashTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "flashx.JPG")
                        self.wastelabel.text = "Flash is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "OR.png")
                        self.readMe(myText: "Flash is your Look Alike")
                    }
                    if firstResult.identifier.contains("JeanTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "jean.JPG")
                        self.wastelabel.text = "Jean Grey is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BL.png")
                        self.readMe(myText: "Jean Grey is your Look Alike")
                    }
                    if firstResult.identifier.contains("MaGOTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "mago.JPG")
                        self.wastelabel.text = "Erik Lensherr (Magneto) is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "GR.png")
                        self.readMe(myText: "Erik Lensherr (Magneto) is your Look Alike")
                    }
                    if firstResult.identifier.contains("MagTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "mag.JPG")
                        self.wastelabel.text = "Erik Lensherr (Magneto) is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Erik Lensherr (Magneto) is your Look Alike")
                    }
                    if firstResult.identifier.contains("PXOTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "pxo.JPG")
                        self.wastelabel.text = "Charles Francis Xavier (Professor X) is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Charles Francis Xavier (Professor X) is your Look Alike")
                    }
                    if firstResult.identifier.contains("PXTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "px.JPG")
                        self.wastelabel.text = "Charles Francis Xavier (Professor X) is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Charles Francis Xavier (Professor X) is your Look Alike")
                    }
                    if firstResult.identifier.contains("RavenTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "rav.JPG")
                        self.wastelabel.text = "Raven Darkhölme (Mystique) is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Raven Darkhölme (Mystique) is your Look Alike")
                    }
                    if firstResult.identifier.contains("StormTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "strom.JPG")
                        self.wastelabel.text = "Storm is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Storm is your Look Alike")
                    }
                    if firstResult.identifier.contains("VolvTR") {
                        self.gifImg.image = UIImage(imageLiteralResourceName: "wolv.JPG")
                        self.wastelabel.text = "Logan Wolverine is your Look Alike"
                        //                    self.bgv.image = UIImage(imageLiteralResourceName: "BR.png")
                        self.readMe(myText: "Logan Wolverine is your Look Alike")
                    }
                    
                }
                
                print(results)
            }
            
            let handler = VNImageRequestHandler(ciImage: image)
            
            do {
                try handler.perform([request])
            }
            catch {
                print(error)
            }
            
            animateIn()
            
        }
        
        
        
        
    }
    
    
    
    @IBAction func cameraTapped(_ sender: UIButton) {
        
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func readMe(myText: String) {
        let utterance = AVSpeechUtterance(string: myText)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4
//        utterance.pitchMultiplier = 0.5
        utterance.preUtteranceDelay = 0
        utterance.volume = 1
        //        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
}
