//
//  Extensions.swift
//  BubblePop
//
//  Created by Martinus Andika Novanawa on 20/04/23.
//

import Foundation

extension DateComponentsFormatter {
    static let abbreviated: DateComponentsFormatter = {
        print("Initializing DateComponentFormatter.abbreviated")
        let formatter = DateComponentsFormatter()

        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated

        return formatter
    }()

    static let positional: DateComponentsFormatter = {
        print("Initializing DateComponentFormatter.positional")
        let formatter = DateComponentsFormatter()

        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        return formatter
    }()
}
