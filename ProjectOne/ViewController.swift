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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        if (sw.isOn){
            saveText.text = "Save"
            let data = DBHelper.inst.getData()
            for st in data {
                username.text = st.email
                password.text = st.password
            }
        }
        else{
            sw.isOn = false
            saveText.text = "Do not Save"
        
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

        let data = DBHelper.inst.getData()
        for st in data {
        
        var userName = username.text!
        var pass = password.text!
        
            if (userName != st.email  || pass != st.password)
        {
       
            errorMsg.text =  "incorrect Email or password try again!"
            errorMsg.textColor = UIColor.red
    }
        else{
            errorMsg.isHidden = true
                   if sw.isOn{
                    username.text = st.email
                    password.text = st.password
                   }
                   else{
                       print("")
                   }
            var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil )
            var wel = sb.instantiateViewController(withIdentifier: "Welcome")
            as! WelcomeViewController
            present(wel,animated: true, completion:nil)
           
        }
        }
        
      
    }
    
//    @IBAction func save(_ sender: Any) {
//        if  sw.isOn{
//            saveText.text = "Save"
//
//        ud.set(username.text, forKey : "username")
//        ud.set(password.text, forKey: "password")
//        ud.set(true,forKey: "state")
//        print("Data saved")
//        }
//        else{
//            ud.removeObject(forKey: "username")
//            ud.removeObject(forKey: "password")
//            saveText.text = "Do not Save"
//        }
//    }
}
