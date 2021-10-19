//
//  ViewController.swift
//  CryptoMrypto
//
//  Created by Ahmet Fatih YILMAZ on 17.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListViewModel : CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        tableView.delegate = self
        tableView.dataSource = self
        
        //user key = c5d64d62d963186731805c5610796f912d68a002
        getData()
      
    }
    
    func getData(){
        
        DispatchQueue.global().async {
            let url = URL(string: "https://api.nomics.com/v1/currencies/ticker?key=c5d64d62d963186731805c5610796f912d68a002")!
            Webservice().downloadCurrencies(url: url) { (cryptos) in
                if let cryptos = cryptos {
                    self.cryptoListViewModel = CryptoListViewModel(cryptoModelList: cryptos)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                        print("\(cryptos) \n")
                    }
                    
                }
            }
        }
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoModelAtIndex(indexPath.row)
        cell.cryptoName.text = "\(cryptoViewModel.name)/USD"
        cell.cryptoPrice.text = cryptoViewModel.price
      //  let url = URL(string: cryptoViewModel.logoUrl)
       // let defaultUrl = URL(string: "https://image.pngaaa.com/391/204391-small.png")
    /*   DispatchQueue.global().async {
      //      let data = try? Data(contentsOf: (url ?? defaultUrl)!)
        
             // url nil dönüyor kontrol et
            DispatchQueue.main.async {
                //cell.cryptoImage.image = UIImage(data: data!)
            }
        }*/
        
        
        return cell
    }

   
    
}

