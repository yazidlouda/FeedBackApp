//
//  ForgotPasswordViewController.swift
//  ProjectOne
//
//  Created by Home on 4/25/21.
//

import UIKit
import MessageUI
class ForgotPasswordViewController: UIViewController , MFMessageComposeViewControllerDelegate{

   
    @IBOutlet weak var enterCode: UITextField!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var sendPassword: UIButton!
    @IBOutlet weak var enterNewPassword: UITextField!
    @IBOutlet weak var confirmNewPassword: UITextField!
    @IBOutlet weak var ok: UIButton!
    @IBOutlet weak var update: UIButton!
    let random = Int.random(in: 1000..<9999)
    override func viewDidLoad() {
        super.viewDidLoad()
        ok.isHidden = true
        enterCode.isHidden = true
        enterNewPassword.isHidden = true
        confirmNewPassword.isHidden = true
        update.isHidden = true
        // Do any additional setup after loading the view.
    }
    
  
    
    @IBAction func sendPassword(_ sender: Any) {
        
        let data = DBHelper.inst.getData()
        for st in data
        {
            if (email.text == st.email){
              //  let mvc = MFMessageComposeViewController()
               
//                mvc.recipients = [""]
//                mvc.body = String(random)
//                mvc.messageComposeDelegate = self
//                self.present(mvc, animated: true, completion: nil)
                ok.isHidden = false
                enterCode.isHidden = false
                sendPassword.isHidden = true
                email.isHidden = true
                label.isHidden = true
               
                print(random)
                
                
                
            }else if (email.text != st.email){
                
                label.text = "Enter a valid Email "
                label.textColor = UIColor.red
                
        }
    }

}

    @IBAction func continueButton(_ sender: Any) {
        
        if(enterCode.text == String(random)){
            
            enterNewPassword.isHidden = false
            confirmNewPassword.isHidden = false
            update.isHidden = false
            
            ok.isHidden = true
            enterCode.isHidden = true
            
            sendPassword.isHidden = true
            email.isHidden = true
            label.isHidden = true
        }else{
            label.text = "Code Incorrect "
            label.textColor = UIColor.red
            label.isHidden = false
        }

    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .sent:
            print("message sent")
            dismiss(animated: true, completion: nil)
        case .cancelled:
            print("message cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("failed to send")
            dismiss(animated: true, completion: nil)
        default:
            print("")
        }
    }
    
    
    @IBAction func updatePassword(_ sender: Any) {
        
        let dic = ["enterNewPassword" : enterNewPassword.text , "confirmNewPassword" : confirmNewPassword.text ]
        DBHelper.inst.updateData(object: dic as! [String:String])
        
                var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil )
                var wel = sb.instantiateViewController(withIdentifier: "Login")
                as! ViewController
                present(wel,animated: true, completion:nil)
    }
    
}
