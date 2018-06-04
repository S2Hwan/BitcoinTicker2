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



class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let bitCoinURL = "https://api.bithumb.com/public/ticker/"
    
//    let bitCoinArray = ["BTC", "ETH", "DASH", "LTC", "ETC", "XRP", "BCH", "XMR", "ZEC", "QTUM", "BTG", "EOS", "ICX", "VEN", "TRX", "ELF", "MITH", "MCO", "OMG", "KNC", "GNT", "HSR", "ZIL", "ETHOS", "PAY", "WAX", "POWR", "LRC", "GTO", "STEEM", "STRAT"]
    
    //let detailArray = ["BTC", "ETH", "DASH", "LTC", "ETC", "XRP", "BCH", "XMR", "ZEC", "QTUM", "BTG", "EOS", "ICX", "VEN", "TRX", "ELF", "MITH", "MCO", "OMG", "KNC", "GNT", "HSR", "ZIL", "ETHOS", "PAY", "WAX", "POWR", "LRC", "GTO", "STEEM", "STRAT"]

    
        let indexArray = ["최고가", "최저가"]
    
    var BTCURL = "https://api.bithumb.com/public/ticker/BTC"
    var ETHURL = "https://api.bithumb.com/public/ticker/ETH"
   
    
    //let data = currencyData()
    
    @IBOutlet weak var coinIcon: UIImageView!
    @IBOutlet weak var coinName: UILabel!
    
    @IBOutlet weak var detailPicker: UIPickerView!
    
    @IBOutlet weak var maxLabel: UILabel!
    
    @IBOutlet weak var minLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailPicker.delegate = self
        detailPicker.dataSource = self

        coinName.text = coinData[myIndex]
        coinIcon.image = UIImage(named: coinData[myIndex])
        
        //finalURL = "https://api.bithumb.com/public/ticker/DASH"
        
        getMaxBitcoinData(url: bitCoinURL + coinData[myIndex])
        getMinBitcoinData(url: bitCoinURL + coinData[myIndex])
       
    
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return indexArray.count

    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return indexArray[row]

    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
//        let selectedMain = coinData[row]
        var selected = indexArray[row]
        
        
//        if selectedMain == coinData[0] {
//            selected = indexArray[0]
//        }
        
        
        
        
        if selected == indexArray[0] {
            getMaxBitcoinData(url: bitCoinURL + coinData[row])
        } else {
            getMinBitcoinData(url: bitCoinURL + coinData[row])
        }
        
//        if selected == indexArray[0] {
//            getMaxBitcoinData(url: BTCURL)
//        } else {
//            getMinBitcoinData(url: BTCURL)
//        }
//
      



    }

//    MARK: - Networking
//    *************************************************************

    func getMaxBitcoinData(url: String) {

        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess {

                print("Success")

                let bitcoinJSON : JSON = JSON(response.result.value as Any)

                self.maxBitCoinData(json: bitcoinJSON)
               

                //print(bitcoinJSON)

            } else {
                print("Error: \(String(describing: response.result.value))")

            }
        }
    }
    
    func getMinBitcoinData(url: String) {
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                
                print("Success")
                
                let bitcoinJSON : JSON = JSON(response.result.value as Any)
                
                
                self.minBitCoinData(json: bitcoinJSON)
                
                //print(bitcoinJSON)
                
            } else {
                print("Error: \(String(describing: response.result.value))")
                
            }
        }
    }

    /***************************************************************/
    //MARK: - JSON Parsing

    func maxBitCoinData(json : JSON) {

        let bitcoinResult = json["data"]["max_price"].intValue

       maxLabel.text = String(bitcoinResult)

    }

    func minBitCoinData(json : JSON) {

        let bitcoinResult2 = json["data"]["min_price"].intValue

        minLabel.text = String(bitcoinResult2)

    }
    

    
}



