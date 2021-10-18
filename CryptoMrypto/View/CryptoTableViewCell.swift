//
//  CryptoTableViewCell.swift
//  CryptoMrypto
//
//  Created by Ahmet Fatih YILMAZ on 18.10.2021.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {


    @IBOutlet weak var cryptoImage:UIImageView!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
