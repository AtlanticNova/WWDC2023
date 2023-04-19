//
//  BubblePopView.swift
//  BubblePop
//
//  Created by Martinus Andika Novanawa on 17/04/23.
//

import SwiftUI
import AVFoundation

struct BubblePopView: View {
    let popSound = Bundle.main.url(forResource: "BubblePop", withExtension: "mp3")
    var audioPlayer: AVAudioPlayer!

    @State private var remainingSeconds = 60
    @State private var maxBubbleNumber = 1
    @State private var score : Double = 0
    @State private var lastBubbleValue: Double = 0
    @State private var playerName: String = ""
    @State private var rankingDictionary = [String : Double]()
    @State private var previousRankingDictionary: [String : Double]?
    @State private var sortedHighScoreArray = [(key: String, value: Double)]()

    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
//            setRemainingTime()
//            removeBubble()
//            createBubble()
        }
    }

    var body: some View {
        ZStack{
            Text("test")
        }
    }
}

struct BubblePopView_Previews: PreviewProvider {
    static var previews: some View {
        BubblePopView()
    }
}

