//
//  CryptoViewModel.swift
//  CryptoMrypto
//
//  Created by Ahmet Fatih YILMAZ on 18.10.2021.
//

import Foundation


struct CryptoListViewModel {
    let cryptoModelList : [CryptoModel]

    func numberOfRowsInSection() -> Int {
        self.cryptoModelList.count
    }
    
    func cryptoModelAtIndex(_ index : Int) -> CryptoViewModel {
        let crypto = self.cryptoModelList[index]
        return CryptoViewModel(cryptoModel: crypto)
    }

}

struct CryptoViewModel {
    let cryptoModel : CryptoModel
    
    var currency : String {
        return self.cryptoModel.currency
    }
    var name : String {
        return self.cryptoModel.name
    }
    var logoUrl : String {
        return self.cryptoModel.logo_url
    }
    var price : String {
        return self.cryptoModel.price
    }
    
    
    
}
