//
//  TabBarCustomView.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import SwiftUI

struct TabBarCustomView: View {
    @Binding var selectedItem: Int
    
    @State private var items: [TabBar.Item] = [
        .init(imageName: Asset.homeTab.name),
        .init(imageName: Asset.docTab.name),
        .init(imageName: Asset.achievementsTab.name)
    ]
    
    private var arrange: [Int] {
        Array(0..<items.count)
    }
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        Asset.tabBarBg.swiftUIImage
            .resizable()
            .scaledToFit()
            .overlay {
                HStack {
                    let arrange = (0..<items.count)
                    ForEach(arrange, id: \.self) { index in
                        let item = items[index]
                        let isSelected = index == selectedItem
                
                        VStack(spacing: 2) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                            
                            Rectangle()
                                .foregroundStyle(isSelected ? Colors.darkGrayCustom.swiftUIColor : .clear)
                                .frame(width: 50, height: 3)
                                .cornerRadius(4, corners: .allCorners)
                        }
                        .onTapGesture {
                            withAnimation {
                                selectedItem = index
                            }
                        }

                        if index < arrange.count - 1 {
                            Spacer()
                        }
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal, 35)
            }
    }
}

#Preview {
    TabBarCustomView(selectedItem: .constant(0))
}
