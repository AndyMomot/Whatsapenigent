//
//  GreenDivider.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import SwiftUI

struct GreenDivider: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 48)
            .foregroundStyle(Colors.greenLite.swiftUIColor)
            .frame(height: 2)
    }
}

#Preview {
    GreenDivider()
}
