//
//  ViewController.swift
//  ProjectOne
//
//  Created by Home on 4/20/21.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    //let ud = UserDefaults.standard
    var hide = true
    @IBOutlet weak var hidePassword: UIButton!
    @IBOutlet weak var errorMsg: UILabel!
   
    @IBOutlet weak var sw: UISwitch!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var saveText: UILabel!
    
    
    @IBOutlet weak var signinConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var signupButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var signinButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    @IBOutlet weak var userNameConstraint: NSLayoutConstraint!
    static var userId : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signinConstraint.constant -= view.bounds.width
        signinButtonConstraint.constant -= view.bounds.width
        passwordConstraint.constant -= view.bounds.width
        userNameConstraint.constant -= view.bounds.width
        signupButtonConstraint.constant -= view.bounds.width
        let data = DBHelper.inst.getData()
        for st in data {

            if (sw.isOn){
            if(st.email != nil){

                saveText.text = "Save"
                username.text = st.email
                password.text = st.password
            }
                else{
                    print("there is no data")

            }

    }else
            {
                saveText.text = "Do not Save"

            }

        }
}
    var animationPerformedOnce = false
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !animationPerformedOnce {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.signinConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
                }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
                self.userNameConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
                }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.passwordConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
                }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.7, options: .curveEaseOut, animations: {
                self.signinButtonConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
                }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.9, options: .curveEaseOut, animations: {
                self.signupButtonConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
                }, completion: nil)
            animationPerformedOnce = true
        }

    }
  //Show and hide password
    @IBAction func hidePassword(_ sender: UIButton) {
        
        if(hide == true) {
                   password.isSecureTextEntry = false
            hidePassword.setTitle("Hide", for: .normal)
               } else {
                   password.isSecureTextEntry = true
                hidePassword.setTitle("Show", for: .normal)
               }

               hide = !hide
        
    }
    
  
    @IBAction func login(_ sender: Any)
    {

        let data = DBHelper.inst.getOneData(email: username.text!)
     //   for st in data {
        if(DBHelper.checkData){
            
        
        var userName = username.text!
        var pass = password.text!
        
            if (userName != data.email  || pass != data.password)
        {
       
            errorMsg.text =  "incorrect Email or password try again!"
            errorMsg.textColor = UIColor.red
    }
        else{
            ViewController.userId = data.email
            errorMsg.isHidden = true
                 //  if sw.isOn{
                    username.text = data.email
                    password.text = data.password
                    print(data.email!)
//                   }
//                   else{
//                       print("")
//                   }
            var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil )
            var wel = sb.instantiateViewController(withIdentifier: "Welcome")
            as! ResortPickerViewController
            present(wel,animated: true, completion:nil)
           
   //     }
        }
        
      
    }
    

}

}
