//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Hamit  Tırpan on 11.10.2019.
//  Copyright © 2019 Hamit  Tırpan. All rights reserved.
//

import UIKit
import Parse

class SignUpVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Parse nesnesi oluşturdum.
        //let parseObject = PFObject(className: "Fruits")
        // Oluşturduğum parse nesnesini Dictionary gibi kullanabiliyorum. Key - Value
        
        /*
        parseObject["name"] = "Apple"
        parseObject["calories"] = 100
        parseObject.saveInBackground { (objects, error) in
            if error != nil{
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
            } else {
                self.makeAlert(titleInput: "Success", messageInput: "Upload Successful")
            }
        }
        */
        
        // Parse server'dan veri çekme. Sınırlama kullanmak için where/ less / higher than kullanılabilir.
        
        /*
        let query = PFQuery(className: "Fruits").whereKey("name", equalTo: "Apple")
        query.findObjectsInBackground { (objects, error) in
            if error != nil{
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
            } else {
                print(objects)
            }
        }
        */
        
        
        
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if usernameText.text != "" && passwordText.text != "" {
            
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!) { (user, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password ?")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            
            let user = PFUser()
            user.username = usernameText.text
            user.password = passwordText.text
            
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    // Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password?")
        }
    }
    
    
    func makeAlert(titleInput:String, messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }


}

