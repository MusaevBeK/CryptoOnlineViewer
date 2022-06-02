//
//  InfoPageController.swift
//  CryptoOnlineViewer
//
//  Created by user on 20/5/22.
//

import UIKit

class InfoPageController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var cryptoImage: UIImageView!

    @IBOutlet weak var backButtonPropertys: UIButton!
    
    var transferName: String? = nil
    var transferInfo = ""
    var transferPrice = ""
    var transferCryptoImage = UIImageView()


    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = transferName
        info.text = transferInfo
        price.text = transferPrice
        cryptoImage.image = transferCryptoImage.image
        
        backButtonPropertys.layer.cornerRadius = 15

    }
   
}
