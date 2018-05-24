//
//  DetailViewController.swift
//  BitcoinTicker
//
//  Created by S2H on 2018. 5. 24..
//  Copyright © 2018년 S2H. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let bitCoinURL = "https://api.bithumb.com/public/ticker/"
    
    let bitCoinArray = ["BTC", "ETH", "DASH", "LTC", "ETC", "XRP", "BCH", "XMR", "ZEC", "QTUM", "BTG", "EOS", "ICX", "VEN", "TRX", "ELF", "MITH", "MCO", "OMG", "KNC", "GNT", "HSR", "ZIL", "ETHOS", "PAY", "WAX", "POWR", "LRC", "GTO", "STEEM", "STRAT"]
    
    let detailArray = ["최근 24시간 내 시작 거래금액", "최근 24시간 내 마지막 거래금액","최근 24시간 내 최저 거래금액"]
    
    var finalURL = ""
    
    
   
    
    
    @IBOutlet weak var coinIcon: UIImageView!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var detailPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailPicker.delegate = self
        detailPicker.dataSource = self
        
        
            
//            tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
//        cell.coinName.text = bitCoinArray[indexPath.row]
//        cell.iconImage.image = UIImage(named: bitCoinArray[indexPath.row])
//        cell.iconImage.layer.cornerRadius = cell.cellView.frame.height / 2
//
//        return cell
//
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return detailArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return detailArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        finalURL = bitCoinURL + bitCoinArray[row]
        getBitcoinData(url: finalURL)
    }
    
    //MARK: - Networking
    /***************************************************************/
    func getBitcoinData(url: String) {
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                print("Success")
                let bitcoinJSON : JSON = JSON(response.result.value)
                
                self.updateBitcoinData(json: bitcoinJSON)
                
            } else {
                print("Error: \(String(describing: response.result.value))")
                
            }
        }
        
        
    }
    /***************************************************************/
    //MARK: - JSON Parsing
    
    func updateBitcoinData(json : JSON) {
        
        let bitcoinResult = json["data"]["opening_price"].intValue
        
        coinName.text = String(bitcoinResult)
        
        
        
    }
    

    

}
