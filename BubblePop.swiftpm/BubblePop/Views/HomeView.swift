//
//  SwiftUIView.swift
//  BubblePop
//
//  Created by Martinus Andika Novanawa on 17/04/23.
//

import SwiftUI
import AVKit

struct HomeView: View {
    @StateObject var bubblePopVM: BubblePopViewModal
    @State private var musicPlayer = false
    var body: some View {
        ZStack {
            
            Image("HolographicBackgroundImg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image(bubblePopVM.bubblePop.image)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                    .shadow(color:.white, radius: 10)
                    .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(Color.white, style: StrokeStyle(lineWidth: 4)))
                    .padding(.bottom)
                
                Button{
                    musicPlayer = true
                } label: {
                    Label("Play", systemImage: "play.fill")
                        .foregroundColor(Color(red: 106/255, green: 163/255, blue: 241/255))
                        .padding(.init(top: 10, leading: 65, bottom: 10, trailing: 65))
                        .font(.system(size: 52, weight: .bold))
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(color: .white, radius: 10)
                }
                
                Text(bubblePopVM.bubblePop.title)
                    .font(.system(size: 32))
                    .bold()
                    .padding(.init(top: 50, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(.blue)
                    .shadow(color: .white, radius: 12)
                
                Rectangle()
                    .foregroundColor(.white)
                    .padding(.horizontal, 42)
                    .frame(width: 800, height: 5)
                
                Text(bubblePopVM.bubblePop.description)
                    .font(.system(size: 32))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blue)
                    .shadow(color: .white, radius: 12)
                    
            }
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $musicPlayer){
            BubblePopView(bubblePopVM: bubblePopVM)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let bubblePopVM = BubblePopViewModal(bubblePop: BubblePop.data)
    static var previews: some View {
        HomeView(bubblePopVM: bubblePopVM)
    }
}
