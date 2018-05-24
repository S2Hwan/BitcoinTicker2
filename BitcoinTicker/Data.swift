//
//  Data.swift
//  BitcoinTicker
//
//  Created by S2H on 2018. 5. 25..
//  Copyright © 2018년 S2H. All rights reserved.
//

import UIKit


class Data {

    var bitcoinName : String
    var coinIconimage : UIImage

    init(bitcoinName : String) {

        self.bitcoinName = bitcoinName
        
        coinIconimage = UIImage(named: self.bitcoinName)!


    }


    
    
}

