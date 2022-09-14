//
//  SceondScreenViewController.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 08/09/2022.
//

import UIKit
import Alamofire
class SceondScreenViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {
//    fileprivate var movies: [coffeeDataModel] = []
    var users :[NetworkDataModel] = []
    var data = UserViewModel()
    
    @IBOutlet weak var tableView: UITableView!
 
//    var cellcomponent = TableViewCell()
    @IBOutlet weak var badge: UITabBarItem!
    override func viewDidLoad() {
        data.fatchingData { respons in
        switch respons{
        case .success(let user ) :
                
            self.users.append(contentsOf: user)
            self.tableView.reloadData()
               
        case .failure(_):
                
                let alert = UIAlertController(title: "error", message: "something error , try agin later ", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                alert.addAction(UIAlertAction(title: "okay", style: .cancel))
                
            }
        }
        
        
        if #available(iOS 13.0, *) {
                // Always adopt a light interface style.
                overrideUserInterfaceStyle = .light
            }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        cell.name.text = users[indexPath.row].name
        cell.configureCell(coffee: users[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "THreedScreenViewController") as! THreedScreenViewController
        print(users[indexPath.row])
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        vc.coffeeDetials = users[indexPath.row]
        self.present(vc, animated: true)
    }
}


    
    
    
    
    
    
    

