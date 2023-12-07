//
//  ViewController.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 08/09/2022.
//

import UIKit

import Alamofire
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
class loginScreen: UIViewController ,UITextFieldDelegate{
    let registerprocees = RegisterViewController()
    var product = [coffeeDataModel]()
    let db = Firestore.firestore()
    
    static let userDefaults=UserDefaults()
    
    var result = NSArray()
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorINlogin: UILabel!
    @IBOutlet weak var Username: UITextField!
    var items : [Users] = []
    
    @IBAction func loginButton(_ sender: Any) {
        if Username.text == "" || password.text == ""
        {
            let alert = UIAlertController(title: "Information", message: "Please enter all the fields", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }else{
            postRequest()
            setDATA(_coffee: productlist )
        }
    }

     
    // MARK :send data
    
    func setDATA (_coffee:[coffeeDataModel]){
        // Add a new document with a generated id.
        var ref: DocumentReference? = nil
        ref = db.collection("Coffees").addDocument(data: 
          [
            "name" : [_coffee][0] ,
            "price": [_coffee][1],
            "image" : [_coffee][2],
            "imageS" : [_coffee][3],
            "imageM" : [_coffee][4],
            "imageL": [_coffee][5],
            "size" : [_coffee][6],
            "sugar" : [_coffee][6],
            "additions": [_coffee][7] ,
            "isAddedToCart" : [_coffee][8] ,
            "boughtItemsCount" : [_coffee][9]
        ]
        
        
        ) { err in
          if let err = err {
              let alert = UIAlertController(title: "error", message: "something error , try agin later ", preferredStyle: .alert)
              self.present(alert, animated: true, completion: nil)
              alert.addAction(UIAlertAction(title: "okay", style: .cancel))
            print("Error adding document: \(err)")
          } else {
            print("Document added with ID: \(ref!.documentID)")
          }
        }
    }
    
    
    
    
    
    
    
    
    func postRequest() {
        let email = Username.text!
        let password = password.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if error == nil {
                
                
                
                
                let storybord = UIStoryboard(name: "Main", bundle: nil)
                var vc = storybord.instantiateViewController(withIdentifier: "TABBARViewController") as! TABBARViewController
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc ,animated: true , completion: nil )
                
            }else{
                let alert = UIAlertController(title: "Error", message: "Wrong Username or Password", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                
                alert.addAction(ok)
                alert.addAction(cancel)
                
                self?.present(alert, animated: true, completion: nil)
                
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
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}



