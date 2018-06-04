//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by S2H on 2018. 5. 24..
//  Copyright © 2018년 S2H. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var coinData = ["BTC", "ETH", "DASH", "LTC", "ETC", "XRP", "BCH", "XMR", "ZEC", "QTUM", "BTG", "EOS", "ICX", "VEN", "TRX", "ELF", "MITH", "MCO", "OMG", "KNC", "GNT", "HSR", "ZIL", "ETHOS", "PAY", "WAX", "POWR", "LRC", "GTO", "STEEM", "STRAT"]

var myIndex = 0


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    let bitCoinURL = "https://api.bithumb.com/public/ticker/"
//    let bitCoinArray = ["BTC", "ETH", "DASH", "LTC", "ETC", "XRP", "BCH", "XMR", "ZEC", "QTUM", "BTG", "EOS", "ICX", "VEN", "TRX", "ELF", "MITH", "MCO", "OMG", "KNC", "GNT", "HSR", "ZIL", "ETHOS", "PAY", "WAX", "POWR", "LRC", "GTO", "STEEM", "STRAT"]
    //var finalURL = ""
    
    var BTCURL = "https://api.bithumb.com/public/ticker/BTC"
    var ETHURL = "https://api.bithumb.com/public/ticker/ETH"
  
   
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.reloadData()
        
//        getBitcoinData(url: ETHURL)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.coinName.text = coinData[indexPath.row]
        cell.iconImage.image = UIImage(named: coinData[indexPath.row])
        cell.iconImage.layer.cornerRadius = cell.cellView.frame.height / 2
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
//        performSegue(withIdentifier: "goToDetailVC", sender: self)
//
//        finalURL = bitCoinURL + bitCoinArray[indexPath.row]
//        print(finalURL)
//        getBitcoinData(url: finalURL)
        
        
//        var selectedRow = coinData[indexPath.row]
        performSegue(withIdentifier: "goToDetailVC", sender: self)
        
//        if selectedRow == coinData[0] {
//            getBitcoinData(url: BTCURL)
//            performSegue(withIdentifier: "goToDetailVC", sender: self)
//            print(BTCURL)
//
//        } else if selectedRow == coinData[1] {
//            getBitcoinData(url: ETHURL)
//             performSegue(withIdentifier: "goToDetailVC", sender: self)
//            print(self.ETHURL)
//
//        }
        
        
        
        
        
        
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? DetailViewController {
////            destination.data = data[(tableView.indexPathForSelectedRow?.row)!]
//            destination.BTCURL = BTCURL
//            print("asd")
//            destination.ETHURL = ETHURL
//        }
//    }

//
//
//
//
//    func getBitcoinData(url: String) {
//
//        Alamofire.request(url, method: .get).responseJSON { (response) in
//            if response.result.isSuccess {
//
//                print("Success")
//
//                let bitcoinJSON : JSON = JSON(response.result.value as Any)
//
//                self.updateBitcoinData(json: bitcoinJSON)
//                self.updateClosingPriceData(json: bitcoinJSON)
//
//
//
//                //print(bitcoinJSON)
//
//            } else {
//                print("Error: \(String(describing: response.result.value))")
//
//            }
//        }
//    }
//
//    /***************************************************************/
//    //MARK: - JSON Parsing
//
//    func updateBitcoinData(json : JSON) {
//
//        let bitcoinResult = json["data"]["opening_price"].intValue
//
//        //currencyLabel.text = String(bitcoinResult)
//
//    }
//
//    func updateClosingPriceData(json : JSON) {
//
//        let bitcoinResult2 = json["data"]["closing_price"].intValue
//
//        //priceLabel.text = String(bitcoinResult2)
//
//    }



}




