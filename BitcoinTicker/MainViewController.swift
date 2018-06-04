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

var bitCoin = ["비트코인", "이더리움", "리플", "비트코인 캐시", "이오스", "라이트코인", "트론", "대시", "모네로", "비체인", "이더리움 클래식", "퀀텀"]

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bitCoin.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.coinName.text = bitCoin[indexPath.row]
        cell.iconImage.image = UIImage(named: coinData[indexPath.row])
        cell.iconImage.layer.cornerRadius = cell.cellView.frame.height / 2
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        performSegue(withIdentifier: "goToDetailVC", sender: self)
        
    }
}
    




