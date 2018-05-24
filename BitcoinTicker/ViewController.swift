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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
   
    
    
    
    let bitCoinURL = "https://api.bithumb.com/public/ticker/"
    
    let bitCoinArray = ["BTC", "ETH", "DASH", "LTC", "ETC", "XRP", "BCH", "XMR", "ZEC", "QTUM", "BTG", "EOS", "ICX", "VEN", "TRX", "ELF", "MITH", "MCO", "OMG", "KNC", "GNT", "HSR", "ZIL", "ETHOS", "PAY", "WAX", "POWR", "LRC", "GTO", "STEEM", "STRAT"]
    
    var finalURL = ""

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

