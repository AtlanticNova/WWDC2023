//
//  BubblePopView.swift
//  BubblePop
//
//  Created by Martinus Andika Novanawa on 17/04/23.
//

import SwiftUI
import AVFoundation

struct BubblePopView: View {
    @EnvironmentObject var audio: Audio
    var bubblePopVM: BubblePopViewModal
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
            
            Image("HolographicBackgroundImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 32){
                HStack {
                    Button{
                        audio.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 48))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                HStack {
                    Text(bubblePopVM.bubblePop.title)
                        .font(.system(size: 48))
                        .foregroundColor(.white)
                        .bold()
                }
                
                Image(bubblePopVM.bubblePop.image)
                    .resizable()
                    .frame(width: 500, height: 500)
                    .cornerRadius(20)
                    .shadow(color:.white, radius: 10)
                    .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(Color.white, style: StrokeStyle(lineWidth: 4)))
                    .padding(.init(top: 115, leading: 0, bottom: 115, trailing: 0))
                
                if let player = audio.player {
                    VStack(spacing: 5){
                        Slider(value: $value, in: 0...player.duration) {
                            editing in
                            
                            print("editing", editing)
                            if !editing {
                                player.currentTime = value
                            }
                        }
                            .accentColor(.white)
                        
                        HStack {
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                                .font(.system(size: 24))
                            Spacer()
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00 ")
                                .font(.system(size: 24))
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                    }
                    
                    HStack {
                        let color:Color = audio.isLooping ? .black : .white
                        ControlButtonView(systemName: "repeat", color: color){
                            audio.toggleLoop()
                        }
                        Spacer()
                        ControlButtonView(systemName: "gobackward.10"){
                            player.currentTime -= 10
                        }
                        Spacer()
                        ControlButtonView(systemName: player.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 60){
                            audio.playPause()
                        }
                        Spacer()
                        ControlButtonView(systemName: "goforward.10"){
                            player.currentTime += 10
                        }
                        Spacer()
                        ControlButtonView(systemName: "stop.fill"){
                            audio.stop()
                            dismiss()
                        }
                    }
                }
            }
            .padding(30)
        }
        .onAppear{
//            Audio.shared.startMusic(track: bubblePopVM.bubblePop.track, isPreview: isPreview)
            audio.startMusic(track: bubblePopVM.bubblePop.track, isPreview: isPreview)
        }
        .onTapGesture {
            audio.startMusic(track: bubblePopVM.bubblePop.effect, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audio.player, !isEditing else { return }
            value = player.currentTime
        }
    }
}

struct BubblePopView_Previews: PreviewProvider {
    static var previews: some View {
        let bubblePopVM = BubblePopViewModal(bubblePop: BubblePop.data)

        BubblePopView(bubblePopVM: bubblePopVM, isPreview: true)
            .environmentObject(Audio())
    }
}

