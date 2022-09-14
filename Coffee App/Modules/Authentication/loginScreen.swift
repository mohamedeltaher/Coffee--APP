//
//  ViewController.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 08/09/2022.
//

import UIKit
import CoreData
import Alamofire
class loginScreen: UIViewController ,UITextFieldDelegate{
 let registerprocees = RegisterViewController()
   static let userDefaults=UserDefaults()
    
    var result = NSArray()
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorINlogin: UILabel!
    @IBOutlet weak var Username: UITextField!
    var items : [Users] = []
    
//    func segua1 (){
//        let storybord = UIStoryboard(name: "Main", bundle: nil)
//        var vc = storybord.instantiateViewController(withIdentifier: "TABBARViewController")
//        self.present(vc, animated: true, completion: nil)
//    }
//
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        

        if Username.text == "" || password.text == ""
           {
               let alert = UIAlertController(title: "Information", message: "Please enter all the fields", preferredStyle: .alert)

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

       }

    func postRequest() {
        
        let header = [
            "Content-Type": "application/json"
        ]
        	
        let parameters: [String: String?] = [
            "email": Username.text,
           "password": password.text
       
            
        ]
        AF.request("https://bm-coffee-shop-api.herokuapp.com/api/v1/user/login", method:.post, parameters: parameters as Parameters,encoding: JSONEncoding.default,headers: HTTPHeaders(header)) .responseJSON { (response) in
            if let data = response.data {
              do{
                  let userResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                  if (userResponse.token != ""){ let storybord = UIStoryboard(name: "Main", bundle: nil)
                      UDM.shared.defaults?.set(userResponse.email, forKey: "email")
                      UDM.shared.defaults?.set(userResponse.userName, forKey: "username")
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
                  let alert = UIAlertController(title: "Error", message: "Wrong Username or Password", preferredStyle: .alert)

                  let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                  let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

                  alert.addAction(ok)
                  alert.addAction(cancel)

                  self.present(alert, animated: true, completion: nil)
                  
                 
              }
                
              }
            
            }
        
    }
    
        
    
    @IBAction func RegisterButtom(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        Username.resignFirstResponder()
        password.resignFirstResponder()
        
        Username.layer.borderWidth = 2
        Username.layer.borderColor = UIColor.brown.cgColor
        Username.layer.cornerRadius = 10
        password.layer.borderWidth = 2
        password.layer.borderColor = UIColor.brown.cgColor
        password.layer.cornerRadius = 10
        
       
       
        
        
        
        if #available(iOS 13.0, *) {
                // Always adopt a light interface style.
                overrideUserInterfaceStyle = .light
            }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func CheckForUserNameAndPasswordMatch( email: String, password : String)
    {
        let app = UIApplication.shared.delegate as! AppDelegate

        let context = app.persistentContainer.viewContext

        let fetchrequest = NSFetchRequest<Users>(entityName: "Users")

        let predicate = NSPredicate(format: "email = %@", email)

        fetchrequest.predicate = predicate
        do
        {
            result = try context.fetch(fetchrequest) as NSArray

            if result.count>0
            {
                let objectentity = result.firstObject as! Users

    if objectentity.email == email && objectentity.password == password
                {
        
                    print("Login Succesfully")
        
        
                }else{errorINlogin.text = "wrong in login"}
            }else{errorINlogin.text = "wrong in login"}
        }

        catch
        {
            
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
            
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}

