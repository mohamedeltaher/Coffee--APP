//
//  CartTableViewCell.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 10/09/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    var Increase  = 0
    @IBOutlet weak var increaseLABLE: UILabel!
    
    @IBOutlet weak var sizeImage: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
   
    @IBAction func plusbuttom(_ sender: Any) {
        Increase += 1
        increaseLABLE.text = String(Increase)
        
    }
    @IBAction func minsbuttom(_ sender: Any) {
        if Increase > 1 {
        Increase-=1
            increaseLABLE.text = String(Increase)
        }
    }
    func configureCell(coffee: NetworkDataModel){
       setimage(imagelink: coffee.image)
        self.name.text = coffee.name
        self.price.text=String (coffee.price)
        self.increaseLABLE.text=String(coffee.boughtItemsCount)
        self.increaseLABLE.text=String(coffee.boughtItemsCount)
        if(coffee.size==1){
            self.sizeImage.image=UIImage(systemName:"s.circle.fill")
        }else if (coffee.size==2){
            self.sizeImage.image=UIImage(systemName:"m.circle.fill")
        }else if(coffee.size==3){ self.sizeImage.image=UIImage(systemName:"l.circle.fill")}
    }
    override func awakeFromNib() {
        view1.layer.borderWidth = 0.5
        view1.layer.borderColor = UIColor.brown.cgColor
        view1.layer.cornerRadius = 10
        
        
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setimage( imagelink : String){
        if let imageurl = URL(string: imagelink){
            DispatchQueue.main.async {
                self.ImageView.load(url: imageurl)
            }
        }
    }

}
