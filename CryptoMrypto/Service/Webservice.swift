//
//  Webservice.swift
//  CryptoMrypto
//
//  Created by Ahmet Fatih YILMAZ on 18.10.2021.
//

import Foundation


class Webservice {
    
    func downloadCurrencies (url: URL, completion: @escaping ([CryptoModel]?) -> ()) {
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoModel].self, from: data)
                
                //print(cryptoList)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
               
            }
        }.resume()
    }
}
