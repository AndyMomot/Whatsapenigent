//
//  EmployeeCostsResultView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 24.09.2024.
//

import SwiftUI

struct EmployeeCostsResultView: View {
    var items: [EmployeeCostsModel]
    var onDelete: (EmployeeCostsModel) -> Void
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Spacer()
                Text("Wstępne obliczenia")
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                Spacer()
            }
            
            VStack(spacing: 10) {
                ForEach(items) { item in
                    EmployeeCostsResultCell(item: item) { // on delete
                        onDelete(item)
                    }
                }
                
                Spacer(minLength: 20)
            }
        }
        .padding(16)
        .background(Colors.aqua.swiftUIColor)
        .cornerRadius(48, corners: .allCorners)
    }
}

#Preview {
    EmployeeCostsResultView(items: [
        .init(netBenefit: 2332)
    ]) {_ in}
}
