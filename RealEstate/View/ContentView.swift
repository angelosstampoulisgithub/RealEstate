//
//  ContentView.swift
//  RealEstate
//
//  Created by Angelos Staboulis on 10/7/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RentalViewModel()

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(Array(viewModel.signs.enumerated()), id: \.element.id) { index, sign in
                        RentalSignRow(sign: sign)
                            .id(index)
                    }
                }
                .padding(.vertical)
            }
            .onReceive(viewModel.$currentIndex) { index in
                withAnimation(.easeInOut(duration: 0.7)) {
                    proxy.scrollTo(index, anchor: .center)
                }
            }
        }
    }
}
