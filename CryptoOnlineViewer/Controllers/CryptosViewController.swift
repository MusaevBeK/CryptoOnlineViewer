//
//  ViewController.swift
//  CryptoOnlineViewer
//
//  Created by user on 18/5/22.
//

import UIKit
import Kingfisher


class CryptosViewController: UIViewController {
    
    let network = ApiResponse()
        
    var model =  [CryptosModel?]()

    @IBOutlet weak var cryptostableView: UITableView!
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetup()
        getResponse()
}
    // MARK: - Настройки tableView
    func tableViewSetup() {
        cryptostableView.dataSource = self
        cryptostableView.delegate = self
    }
    
    // MARK: - Вызов функции getResponse(network.resonse)
    func getResponse() {
        network.response(urlString: network.requests.urlString) { (model) in
            self.model = model
            self.cryptostableView.reloadData()
        }
    }
    
}

// MARK: - extension для tableView
extension CryptosViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.count 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { fatalError()}
        
        let crypto = model[indexPath.row]
        
        cell.cryptosName.text = crypto?.name
        cell.cryptosInfo.text = crypto?.symbol
        cell.cryptosPrice.text = crypto?.price

        // MARK: - Kingfisher
        if let url = URL(string: crypto?.logo_url ?? "") {
            cell.imageCryptos.kf.setImage(with: url)
        }
    
        return cell
    }
    
  // MARK: - вызов функции didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let transferSelectedData = storyboard?.instantiateViewController(withIdentifier: "InfoPageController") as? InfoPageController
        transferSelectedData?.transferName = model[indexPath.row]?.name ?? ""
        transferSelectedData?.transferInfo = model[indexPath.row]?.symbol ?? ""
        transferSelectedData?.transferPrice = model[indexPath.row]?.price ?? ""
        
        if let url = URL(string: model[indexPath.row]?.logo_url ?? "") {

            transferSelectedData?.transferCryptoImage.kf.setImage(with: url)
        }
        self.present(transferSelectedData!, animated: true, completion: nil)
        
    }
}



