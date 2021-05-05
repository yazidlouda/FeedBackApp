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
    static var userId : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                
//        }
            
                
            }
            
        
    }else
            {
                saveText.text = "Do not Save"
                
            }

        
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
                   if sw.isOn{
                    username.text = data.email
                    password.text = data.password
                    print(data.email!)
                   }
                   else{
                       print("")
                   }
            var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil )
            var wel = sb.instantiateViewController(withIdentifier: "Welcome")
            as! WelcomeViewController
            present(wel,animated: true, completion:nil)
           
   //     }
        }
        
      
    }
    

}

}
