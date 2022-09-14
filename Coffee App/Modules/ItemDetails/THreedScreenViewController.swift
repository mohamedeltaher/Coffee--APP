//
//  THreedScreenViewController.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 09/09/2022.
//

import UIKit
import BadgeHub
class THreedScreenViewController: UIViewController {
    var numberOFCartCell = 0
//    var cups :[NetworkDataModel] = Users
    var coffeeDetials: NetworkDataModel?
    var testcup=0
    
    
    @IBOutlet weak var priceOFproduct: UILabel!
    @IBOutlet weak var addtocart: UIButton!
    
    var badeValue = Int()
    
    @IBOutlet weak var nameOFproduct: UILabel!
    @IBOutlet weak var imageview1: UIImageView!
    @IBOutlet weak var bage: UIBarButtonItem!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var smalSize: UIButton!
    @IBOutlet weak var mediumSize: UIButton!
    @IBOutlet weak var largeSize: UIButton!
    @IBOutlet weak var nosugar: UIButton!
    @IBOutlet weak var largsugar: UIButton!
    @IBOutlet weak var smallsugar: UIButton!
    @IBOutlet weak var mediumsugar: UIButton!
    
    
    @IBOutlet weak var totalLable: UILabel!
    
    @IBAction func addToCart(_ sender: Any) {
        coffeeDetials?.boughtItemsCount=increase
        coffeeDetials?.isAddedToCart=true
        cartitems.append(coffeeDetials ?? NetworkDataModel(name: "a", price: 1, image: "", imageS: "", imageM: "", imageL: "", size: 0, sugar: 0, additions: 0, isAddedToCart: false, boughtItemsCount: 0, id: 0))
        numberOFCartCell = numberOFCartCell + 1
        badeValue += 1
        let hub = BadgeHub(barButtonItem:bage)
        hub?.increment(by: badeValue)
//        hub?.pop()
//        hub?.blink()
//        hub?.showCount()
        

    }
    
    
    
    @IBAction func dissmisBUTTON(_ sender: Any) {
        dismiss(animated: true, completion:nil )
    }
    @IBOutlet weak var total: UILabel!
    @IBAction func add(_ sender: Any) {
        increase+=1
        amount.text = String(increase)
//        guard let total = String(movieDetails?.price ?? 0   * increase) else {return}
        total.text = String(coffeeDetials!.price  * increase)
    }
    @IBAction func mins(_ sender: Any) {
        if increase > 1 {
        increase-=1
            amount.text = String(increase)
            total.text = String(coffeeDetials!.price  * increase)
        }
        
    }
    @IBAction func sugarSIZE111(_ sender: Any) {
        nosugar.alpha = 1
        largsugar.alpha = 0.4
        mediumsugar.alpha = 0.4
        smallsugar.alpha = 0.4
        
    }
    @IBAction func sugarSIZE222(_ sender: Any) {
        nosugar.alpha = 0.4
        largsugar.alpha = 0.4
        mediumsugar.alpha = 0.4
        smallsugar.alpha = 1
        
    }
    @IBAction func sugarSIZE333(_ sender: Any) {
        nosugar.alpha = 0.4
        largsugar.alpha = 0.4
        mediumsugar.alpha = 1
        smallsugar.alpha = 0.4
    }
    @IBAction func sugarSIZE444(_ sender: Any) {
        nosugar.alpha = 0.4
        largsugar.alpha = 1
        mediumsugar.alpha = 0.4
        smallsugar.alpha = 0.4
    
    }
    
    @IBAction func smallSizeButton(_ sender: Any) {
        smalSize.alpha = 1
        mediumSize.alpha = 0.3
        largeSize.alpha = 0.3
        coffeeDetials?.size=1
        
        if (testcup == 1){
            coffeeDetials?.price-=9
        }else if (testcup == 2){
            coffeeDetials?.price-=12
        }
        testcup=0
        price.text=String(coffeeDetials?.price ?? 0)
        total.text = String(coffeeDetials!.price  * increase)

    }
    
    @IBAction func mediumSizeButton(_ sender: Any) {
        smalSize.alpha = 0.3
        mediumSize.alpha = 1
        largeSize.alpha = 0.3
        coffeeDetials?.size=2
        if testcup != 1{
            coffeeDetials?.price += 9}
        
        if (testcup == 2){
            coffeeDetials?.price-=12
        }
        testcup=1
        price.text=String(coffeeDetials?.price ?? 0)
        total.text = String(coffeeDetials!.price  * increase)

    }
    
    
    @IBAction func largeSizeButton(_ sender: Any) {
       
        smalSize.alpha = 0.3
        mediumSize.alpha = 0.3
        largeSize.alpha = 1
        coffeeDetials?.size = 3
        if testcup != 2{
            coffeeDetials?.price += 12}
        if (testcup == 1){
            coffeeDetials?.price -= 9
        
        }
        testcup=2
        price.text=String(coffeeDetials?.price ?? 0)
        total.text = String(coffeeDetials!.price  * increase)

    
    }
    var increase = 1
    override func viewDidLoad() {
        view1.layer.borderWidth = 1
        view1.layer.borderColor = UIColor.brown.cgColor
        view2.layer.borderWidth = 1
        view2.layer.borderColor = UIColor.brown.cgColor
        view3.layer.borderWidth = 1
        view3.layer.borderColor = UIColor.brown.cgColor
        
        nameOFproduct.text = coffeeDetials?.name ?? ""
        price.text = String(coffeeDetials?.price ?? 0)
        total.text = String(coffeeDetials?.price ?? 0)
        setimage(imagelink: coffeeDetials?.image ?? "1")
        
        
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
                // Always adopt a light interface style.
                overrideUserInterfaceStyle = .light
            }
        // Do any additional setup after loading the view.
    }
    func setimage( imagelink : String){
        if let imageurl = URL(string: imagelink){
            DispatchQueue.main.async {
                self.imageview1.load(url: imageurl)
            }
        }
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
