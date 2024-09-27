//
//  AwardsCell.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 27.09.2024.
//

import SwiftUI

struct AwardsCell: View {
    var item: AwardsView.AwardItem
    
    var body: some View {
        VStack {
            Image(item.type.smallImage)
                .resizable()
                .scaledToFit()
                .overlay {
                    if item.isAchieved {
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(.white, lineWidth: 2)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 11)
                            
                            RoundedRectangle(cornerRadius: 18)
                                .foregroundStyle(Colors.greenLite.swiftUIColor.opacity(0.5))
                                .padding(.vertical, 6)
                                .padding(.horizontal, 11)
                            
                            Image(systemName: "checkmark")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .padding(25)
                        }
                    }
                }
            
            Text(item.type.title)
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 12))
        }
    }
}

#Preview {
    AwardsCell(item: .init(type: .costReduction1,
                           isAchieved: false))
}
