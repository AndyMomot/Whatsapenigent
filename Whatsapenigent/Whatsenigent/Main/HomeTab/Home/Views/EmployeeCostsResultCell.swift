//
//  EmployeeCostsResultCell.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 24.09.2024.
//

import SwiftUI

struct EmployeeCostsResultCell: View {
    var item: EmployeeCostsModel
    var onDelete: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(item.name)
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14))
                Spacer()
                
                var simbol: String {
                    if item.netBenefit > .zero {
                        return "+"
                    } else {
                        return ""
                    }
                }
                
                Text("\(simbol)\(item.netBenefit)")
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 14))
                
                Spacer()
                
                HStack(spacing: 10) {
                    Text(item.date.toString(format: .ddMMyyyy))
                        
                    Button {
                        onDelete()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14))
            }
            
            RoundedRectangle(cornerRadius: 48)
                .foregroundStyle(.white)
                .frame(height: 2)
        }
    }
}

#Preview {
    ZStack {
        Colors.aqua.swiftUIColor
        EmployeeCostsResultCell(
            item: .init(netBenefit: 1000)
        ) {}
            .padding(.horizontal)
    }
}
