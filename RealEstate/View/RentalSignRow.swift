//
//  RentalSignRow.swift
//  RealEstate
//
//  Created by Angelos Staboulis on 13/7/26.
//

import SwiftUI

struct RentalSignRow: View {
        let sign: RentalSign

        var body: some View {
            VStack(spacing: 0) {

                ZStack {
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 80)

                    HStack(spacing: 2) {
                        Image(systemName: "house.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 40))

                        Text("ΕΝΟΙΚΙΑΖΕΤΑΙ")
                            .font(.system(size: 42, weight: .heavy))
                            .foregroundColor(.white)
                    }.frame(maxWidth:.infinity,alignment: .leading)
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text(sign.address)
                        .foregroundStyle(.black)
                        .font(.title3)

                    Text(sign.price)
                        .foregroundStyle(.black)
                        .font(.title2)
                        .fontWeight(.bold)

                    Text(sign.details)
                        .foregroundStyle(.black)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.red, lineWidth: 4)
            )
            .cornerRadius(14)
            .shadow(radius: 4)
            .padding(.horizontal)
        }

}
