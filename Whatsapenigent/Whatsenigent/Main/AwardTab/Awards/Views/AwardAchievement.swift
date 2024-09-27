//
//  AwardAchievement.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 27.09.2024.
//

import SwiftUI

struct AwardAchievement: View {
    var item: AwardsView.AwardType
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Image(item.bgImage)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 25))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AwardAchievement(item: .betterPerformance1)
}
