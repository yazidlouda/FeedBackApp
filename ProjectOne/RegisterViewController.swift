//
//  RegisterViewController.swift
//  ProjectOne
//
//  Created by Home on 4/24/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordMismatch: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func save(_ sender: Any) {
        
           
        if(password.text == confirmEmail.text){
            let dic = ["firstName" : firstName.text , "lastName" : lastName.text , "email" : email.text , "password" : password.text , "confirmPassword" : confirmEmail.text]
            DBHelper.inst.addData(object: dic as! [String:String])
            
            var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil )
            var wel = sb.instantiateViewController(withIdentifier: "Login")
            as! ViewController
            present(wel,animated: true, completion:nil)
        }else{
            passwordMismatch.text = "Password mismatch "
            passwordMismatch.textColor = UIColor.red
            
        }
    }
    

}
