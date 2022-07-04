//
//  myTableViewCell.swift
//  CryptoHelper
//
//  Created by Константин Алехин on 02.07.2022.
//

import UIKit

struct CryptoTableViewCellViewModel {
    let name:       String
    let symbol:     String
    let price:      String
    let logo_url:   String
}

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!


    static let identifier = "CryptoTableViewCell"


    func configure(with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        let url = URL(string: "https://cryptoicons.org/api/icon/\(viewModel.symbol.lowercased())/50")
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url!) {
                self.logoImage.image = UIImage(data: data)
            }
        }
    }
}
