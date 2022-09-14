//
//  CartViewController.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 10/09/2022.
//

import UIKit

class CartViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var CartTableView: UITableView!
    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var checkout: UIButton!
    var carts : [NetworkDataModel] = []
    var totalprice = 0

    override func viewDidAppear(_ animated: Bool) {
        carts=cartitems
        DispatchQueue.main.async {
            self.CartTableView.reloadData()
            
        }
        for item in carts {
            totalprice += item.price*item.boughtItemsCount
        }
        total.text=String(totalprice + 5)
        
        
        
    }
    

    override func viewDidLoad() {
       
        if #available(iOS 13.0, *) {
                // Always adopt a light interface style.
                overrideUserInterfaceStyle = .light
            }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carts.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {   let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        cell.configureCell(coffee:carts[indexPath.row])
        return cell
    }
    @IBAction func checkout(_ sender: Any) {
        cartitems=[]
        totalprice = 0
        // create the alert
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "checkmark.circle.fill")
        // 2. Create the attributed string and append the image
        let fullString = NSMutableAttributedString(string: "")
        fullString.append(NSAttributedString(attachment: imageAttachment))

        // 3. Make the alert with an empty title and set the attributedTitle using .setValue
        let alert = UIAlertController(title: "", message: " Your Coffee is recived ", preferredStyle: .alert)
        alert.setValue(fullString, forKey: "attributedTitle")

        // 4. Present the alert
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
        alert.view.tintColor = UIColor.brown
    }
    
    
    
}
