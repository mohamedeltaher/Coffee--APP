//
//  TableViewCell.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 09/09/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    var imagename = ""
    @IBOutlet weak var nextTOPage2: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Imageview: UIImageView!
    
    func configureCell(coffee: NetworkDataModel){
        self.name.text = coffee.name
        self.setimage(imagelink: coffee.image)
    }
    override func awakeFromNib() {
        Imageview.image = UIImage(named: imagename)
        
        super.awakeFromNib()
        // Initialization code
    }
    func setimage( imagelink : String){
        if let imageurl = URL(string: imagelink){
            DispatchQueue.main.async {
                self.Imageview.load(url: imageurl)
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
