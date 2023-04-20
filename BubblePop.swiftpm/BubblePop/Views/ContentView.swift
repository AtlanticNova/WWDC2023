//
//  SwiftUIView.swift
//  
//
//  Created by Martinus Andika Novanawa on 20/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(bubblePopVM: BubblePopViewModal(bubblePop: BubblePop.data))        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
