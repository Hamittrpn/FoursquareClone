//
//  AddPlaceVC.swift
//  FoursquareClone
//
//  Created by Hamit  Tırpan on 12.10.2019.
//  Copyright © 2019 Hamit  Tırpan. All rights reserved.
//

import UIKit

class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeDescriptionText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func chooseImage(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
        
    }
    
    // PhotoLibrary'den foto seçtikten sonra ne yapılacak ?
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if placeNameText.text != "" && placeTypeText.text != "" && placeDescriptionText.text != ""{
            if let choosenImage = imageView.image{
                
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = placeNameText.text!
                placeModel.placeType = placeTypeText.text!
                placeModel.placeDescription = placeDescriptionText.text!
                placeModel.placeImage = choosenImage
            }
            performSegue(withIdentifier: "toMapVC", sender: nil)
            
        } else {
            makeAlert(titleInput: "Error", messageInput: "Place Name/Type/Description")
        }
    }
    
    func makeAlert(titleInput:String, messageInput:String){
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
}
