//
//  RentSignData.swift
//  RealEstate
//
//  Created by Angelos Staboulis on 10/7/26.
//

import Foundation

struct RentalSign: Identifiable, Hashable {
    let id = UUID()
    let address: String
    let price: String
    let details: String
}
