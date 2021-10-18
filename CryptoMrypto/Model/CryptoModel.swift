//
//  CryptoModel.swift
//  CryptoMrypto
//
//  Created by Ahmet Fatih YILMAZ on 18.10.2021.
//

import Foundation


struct CryptoModel : Decodable {
    let currency : String
    let name : String
    let logo_url : String
    let price : String
    
}
