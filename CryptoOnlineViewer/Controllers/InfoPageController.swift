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
    @IBOutlet weak var lofo: UIImageView!
    
    @IBOutlet weak var backButtonPropertys: UIButton!
    var nameCr: String? = nil
    var infoCr = ""
    var priceCr = ""
    var lofoCr = UIImageView()


    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = nameCr
        info.text = infoCr
        price.text = priceCr
        lofo.image = lofoCr.image
        
        backButtonPropertys.layer.cornerRadius = 15

    }
   
}
