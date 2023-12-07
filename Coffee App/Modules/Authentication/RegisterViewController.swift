//
//  RegisterViewController.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 10/09/2022.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var SucessLable: UILabel!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    var item : [Users] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBAction func RegisterButton(_ sender: Any) {
        if EmailTextField.text == "" || PasswordTextField.text == "" || NameTextField.text == ""
            {
                let alert = UIAlertController(title: "Information", message: "Its Mandatort to enter all the fields", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                alert.addAction(ok)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                postRequest()
            }

            
        
        func postRequest() {
            let email = EmailTextField.text!
            let password = PasswordTextField.text!
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error == nil {
                    let storybord = UIStoryboard(name: "Main", bundle: nil)
                    var vc = storybord.instantiateViewController(withIdentifier: "loginScreen") as! loginScreen
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc ,animated: true , completion: nil )
                    self.SucessLable.text = "Registered  Sucessfully"
                    
                }else{
                    let alert = UIAlertController(title: "Error", message: "\(String(describing: error!.localizedDescription))", preferredStyle: .alert)
                    
                    let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                    
                    alert.addAction(ok)
                    alert.addAction(cancel)
                    
                    self.present(alert, animated: true, completion: nil)
                    print(error!)
                }
            }
        }
    }
            
    
    override func viewDidLoad() {
        
        if #available(iOS 13.0, *) {
                // Always adopt a light interface style.
                overrideUserInterfaceStyle = .light
            }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
