//
//  SwiftUIView.swift
//  BubblePop
//
//  Created by Martinus Andika Novanawa on 19/04/23.
//

import SwiftUI

final class BubblePopViewModal: ObservableObject {
    private(set) var bubblePop: BubblePop
    
    init(bubblePop: BubblePop) {
        self.bubblePop = bubblePop
    }
}

struct BubblePop {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let effect: String
    let image: String
    
    static let data = BubblePop(title: "1 MINUTE BUBBLE POP ASMR", description: "Digital experience designed to simulate the satisfying sounds and sensations of popping bubbles", duration: 60, track: "BubblePop", effect: "BubblePopIt", image: "Logo")
}
