//
//  RentSignViewModel.swift
//  RealEstate
//
//  Created by Angelos Staboulis on 10/7/26.
//

import Foundation
import Combine
import SwiftUI

final class RentalViewModel: ObservableObject {
    @Published var signs: [RentalSign] = []
    @Published var currentIndex: Int = 0

    private var timer: AnyCancellable?

    init() {
        loadRealData()
        startAutoScroll()
    }

    private func loadRealData() {
        signs = [
            RentalSign(address: "Κομνηνών 12, Κομοτηνή", price: "€350",
                       details: "Γκαρσονιέρα 35τμ, πλήρως ανακαινισμένη."),
            RentalSign(address: "Θησέως 4, Κομοτηνή", price: "€420",
                       details: "Διαμέρισμα 55τμ, 2 δωμάτια."),
            RentalSign(address: "Πλατεία Ειρήνης, Κομοτηνή", price: "€500",
                       details: "Μεγάλο διαμέρισμα 70τμ, φωτεινό."),
            RentalSign(address: "Αγ. Γεωργίου 22, Κομοτηνή", price: "€300",
                       details: "Studio 28τμ, ιδανικό για φοιτητές."),
            RentalSign(address: "Μπακάλμπαση 9, Κομοτηνή", price: "€380",
                       details: "Διαμέρισμα 45τμ, ήσυχη περιοχή."),
            RentalSign(address: "Σισμάνογλου 3, Κομοτηνή", price: "€450",
                       details: "Διαμέρισμα 60τμ, επιπλωμένο."),
            RentalSign(address: "Κων/νου Παλαιολόγου 18", price: "€520",
                       details: "3άρι 75τμ, κατάλληλο για οικογένεια."),
            RentalSign(address: "Βενιζέλου 7, Κομοτηνή", price: "€340",
                       details: "Γκαρσονιέρα 32τμ, κοντά στην αγορά."),
            RentalSign(address: "Μακεδονίας 10, Κομοτηνή", price: "€410",
                       details: "Διαμέρισμα 50τμ, 1 υπνοδωμάτιο."),
            RentalSign(address: "Ορφέως 2, Κομοτηνή", price: "€360",
                       details: "Studio 30τμ, πρόσφατα βαμμένο.")
        ]
    }

    private func startAutoScroll() {
        timer = Timer.publish(every: 2.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                let next = self.currentIndex + 1
                self.currentIndex = next >= self.signs.count ? 0 : next
            }
    }

    deinit {
        timer?.cancel()
    }
}
