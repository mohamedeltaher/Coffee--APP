//
//  RegisterViewController.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 10/09/2022.
//

import UIKit
import CoreData
import Alamofire
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
            let parameters: [String: String?] = [
                
                "password": PasswordTextField.text,
                "userName": NameTextField.text,
                "email": EmailTextField.text
                
            ]
            AF.request("https://bm-coffee-shop-api.herokuapp.com/api/v1/user/signup", method:.post, parameters: parameters as Parameters,encoding: JSONEncoding.default) .responseJSON { (response) in
                if let data = response.data {
                  do{
                      let userResponse = try JSONDecoder().decode(RegisterResponse.self, from: data)
                      if (userResponse.id != ""){ let storybord = UIStoryboard(name: "Main", bundle: nil)
                          var vc = storybord.instantiateViewController(withIdentifier: "TABBARViewController") as! TABBARViewController
                          vc.modalPresentationStyle = .fullScreen
                          self.present(vc ,animated: true , completion: nil )
                          
                      } else{
                          let alert = UIAlertController(title: "Error", message: "Wrong Username or Password", preferredStyle: .alert)

                          let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                          let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

                          alert.addAction(ok)
                          alert.addAction(cancel)

                          self.present(alert, animated: true, completion: nil)
                          
                      }
                      
                      

                  }catch {
                     
                  }
                    
                  }
                print(response)
                self.SucessLable.text = "Registered  Sucessfully"
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
