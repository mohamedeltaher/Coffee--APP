//
//  profileViewController.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 10/09/2022.
//

import UIKit
import CoreData
class profileViewController: UIViewController {
   
    var items: [Users] = []
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mail: UILabel!
    override func viewDidLoad() {
        if let usernamelabel = UDM.shared.defaults?.value(forKey: "username") as? String{
            name.text=usernamelabel
            
        }
        if let emailLabel = UDM.shared.defaults?.value(forKey: "email") as? String{
            mail.text=emailLabel
            
        }
        imageView1.layer.borderWidth = 1
        imageView1.layer.masksToBounds = false
        imageView1.layer.borderColor = UIColor.black.cgColor
        imageView1.layer.cornerRadius = imageView1.frame.height/2
        imageView1.clipsToBounds = true
        username.layer.borderWidth = 0.5
        username.layer.borderColor = UIColor.brown.cgColor
        username.layer.cornerRadius = 10
        email.layer.borderWidth = 0.5
        email.layer.borderColor = UIColor.brown.cgColor
        email.layer.cornerRadius = 10
        
        fetchData()
        
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
    
    
    
    
    
    func fetchData (){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
        let predict = NSPredicate(
            format: "email = %@", "mohamed@12"
        )
    let req: NSFetchRequest<Users> = Users.fetchRequest()
    req.predicate = predict
    items = try context.fetch(/*Employee.fetchRequest()*/ req)
    for item in items{
        item.name = username.text
        item.email = email.text
    }
    print("total count = \(items.count)")
    } catch { }
    }

}
