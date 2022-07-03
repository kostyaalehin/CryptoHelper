//
//  Models.swift
//  CryptoHelper
//
//  Created by Константин Алехин on 02.07.2022.
//

import Foundation

struct Crypto: Codable {
    let id: String?
    let currency: String?
    let symbol: String?
    let name: String?
    let price: String?
}
