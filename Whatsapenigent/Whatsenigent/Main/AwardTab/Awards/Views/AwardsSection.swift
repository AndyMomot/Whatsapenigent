//
//  AwardsSection.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 27.09.2024.
//

import SwiftUI

struct AwardsSection: View {
    var title: String
    var items: [AwardsView.AwardItem]
    var width: CGFloat?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .foregroundStyle(.white)
                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14))
            
           
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        ForEach(items, id: \.type.index) { item in
                            AwardsCell(item: item)
                                .frame(width: width)
                        }
                    }
                }
                .scrollIndicators(.never)
                .padding(.vertical)
                .padding(.leading)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .bottomLeft])
            }
    }
}

#Preview {
    ZStack {
        Asset.preloaderBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        AwardsSection(title: "Nagrody za redukcję kosztów",
                      items: [
                        .init(type: .costReduction1,
                              isAchieved: true),
                        .init(type: .costReduction2,
                              isAchieved: false),
                        .init(type: .costReduction3,
                              isAchieved: false)
                      ])
    }
}
