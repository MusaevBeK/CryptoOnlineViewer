//
//  CustomTableViewCell.swift
//  CryptoOnlineViewer
//
//  Created by user on 18/5/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let idCell = "CustomTableViewCell"

    @IBOutlet weak var cryptosName: UILabel!
    
    @IBOutlet weak var imageCryptos: UIImageView!
    
    @IBOutlet weak var cryptosInfo: UILabel!
    
    @IBOutlet weak var cryptosPrice: UILabel!

}
