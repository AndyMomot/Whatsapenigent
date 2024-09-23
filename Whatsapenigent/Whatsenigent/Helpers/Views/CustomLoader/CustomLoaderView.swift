//
//  CustomLoaderView.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 21.09.2024.
//

import SwiftUI

struct CustomLoaderView: View {
    @State private var progress: CGFloat = 0.0
    @State private var timer: Timer?
    var onDidLoad: () -> Void
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<10, id: \.self) { index in
                Circle()
                    .fill(index < Int(progress) ? Color.green : Color.gray.opacity(0.3))
                    .frame(width: 20, height: 20)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.green, lineWidth: 2)
                .frame(height: 20)
                .padding(.horizontal, -8)
        )
        .padding(.horizontal)
        .onAppear {
            startTimer()
        }
    }
}

private extension CustomLoaderView {
    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                progress = (progress + 1).truncatingRemainder(dividingBy: 11)
                if progress >= 10 {
                    stopTimer()
                    onDidLoad()
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    CustomLoaderView {}
}
