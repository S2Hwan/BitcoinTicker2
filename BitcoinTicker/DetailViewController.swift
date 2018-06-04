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

class DetailViewController: UIViewController {
    
    @IBOutlet weak var coinIcon: UIImageView!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var avgLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var ratePriceLabel: UILabel!
    
    let bitCoinURL = "https://api.bithumb.com/public/ticker/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinName.text = bitCoin[myIndex]
        coinIcon.image = UIImage(named: coinData[myIndex])
        
       
        
        
       
        
        getBitcoinData(url: bitCoinURL + coinData[myIndex])
    
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
//    MARK: - Networking
//    *************************************************************
    func getBitcoinData(url: String) {

        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess {

                print("Success")

                let bitcoinJSON : JSON = JSON(response.result.value as Any)

                //self.maxBitCoinData(json: bitcoinJSON)
                self.updateBitCoinData(json: bitcoinJSON)
                
                //print(bitcoinJSON)

            } else {
                print("Error: \(String(describing: response.result.value))")

            }
        }
    }
    /***************************************************************/
    //MARK: - JSON Parsing
    func updateBitCoinData(json : JSON) {
        
        let maxData = json["data"]["max_price"].intValue
        let minData = json["data"]["min_price"].intValue
        let avgData = json["data"]["average_price"].intValue
        let ratePriceData = json["data"]["24H_fluctate"].intValue
        let rateData = json["data"]["24H_fluctate_rate"].doubleValue
         
        
        maxLabel.text = String(maxData) + " 원"
        minLabel.text = String(minData) + " 원"
        avgLabel.text = String(avgData) + " 원"
        rateLabel.text = String(ratePriceData) + " 원"
        ratePriceLabel.text = String(rateData) + " %"
        
    }
}



