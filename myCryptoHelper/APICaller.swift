//
//  APICaller.swift
//  CryptoHelper
//
//  Created by Константин Алехин on 02.07.2022.
//

import Foundation

final class APICaller {
    static let shared = APICaller()

    private struct Constans {
        static let apiKey = ""
    }

    private init() {

    }

    public func getAllCryptoData(complition: @escaping (Result<[String], Error>) -> Void) {
        
    }
}
