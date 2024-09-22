//
//  TabBar.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import SwiftUI

struct TabBar: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                TabView(selection: $viewModel.selection) {
                    HomeView()
                        .tag(TabBarSelectionView.home.rawValue)
                    
                    Text("Doc")
                        .tag(TabBarSelectionView.doc.rawValue)
                    
                    Text("achievements")
                        .tag(TabBarSelectionView.achievements.rawValue)
                }
                .padding(.bottom, geo.safeAreaInsets.bottom)
                
                TabBarCustomView(selectedItem: $viewModel.selection)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    TabBar()
}
