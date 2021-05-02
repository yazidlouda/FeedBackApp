//
//  ForgotPasswordViewController.swift
//  ProjectOne
//
//  Created by Home on 4/25/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

   
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var labelShow: UILabel!
    @IBOutlet weak var ok: UIButton!
    //    @IBOutlet weak var ok: UIButton!
//    @IBOutlet weak var label3: UILabel!
//    @IBOutlet weak var labelShow: UILabel!
//    @IBOutlet weak var label: UILabel!
//    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ok.isHidden = true
        // Do any additional setup after loading the view.
    }
    
  
    
    @IBAction func sendPassword(_ sender: Any) {
        let data = DBHelper.inst.getData()
        for st in data
        {
            if (email.text == st.email){
                ok.isHidden = false
                labelShow.text = st.password
                label3.text = "Your password is "
                label3.textColor = UIColor.green
                label.isHidden = true
            }else{
                
                label.text = "Enter a valid Email "
                label.textColor = UIColor.red
        }
    }
    

}

    @IBAction func continueButton(_ sender: Any) {
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil )
        var wel = sb.instantiateViewController(withIdentifier: "Login")
        as! ViewController
        present(wel,animated: true, completion:nil)
    }
    
   
}
