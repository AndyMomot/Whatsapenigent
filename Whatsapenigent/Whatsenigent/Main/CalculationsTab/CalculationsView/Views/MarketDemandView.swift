//
//  MarketDemandView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 24.09.2024.
//

import SwiftUI

struct MarketDemandView: View {
    @Binding var numberOfBuyers: String
    @Binding var purchasedByByer: String
    @Binding var times: String
    @Binding var price: String
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Po dokonaniu oceny bieżących kosztów i korzyści, a także potencjalnych korzyści, można określić rekomendacje dotyczące optymalnego zatrudnienia.")
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                .multilineTextAlignment(.center)
            
            Text("Popyt rynkowy")
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 25) {
                CalculationField(
                    title: "Liczba potencjalnych nabywców",
                    text: $numberOfBuyers)
                .frame(height: 35)
                
                CalculationField(
                    title: "Średnia ilość zakupiona przez kupującego",
                    text: $purchasedByByer)
                .frame(maxHeight: 35)
                
                CalculationField(
                    title: "Czasy",
                    text: $times)
                .frame(maxHeight: 35)
                
                CalculationField(
                    title: "Cena",
                    text: $price)
                .frame(maxHeight: 35)
            }
        }
    }
}

#Preview {
    MarketDemandView(
        numberOfBuyers: .constant(""),
        purchasedByByer: .constant(""),
        times: .constant(""),
        price: .constant(""))
    .padding(.horizontal)
}
