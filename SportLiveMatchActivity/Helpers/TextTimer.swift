//
//  TextTimer.swift
//  SportLiveMatchActivityExtension
//
//  Created by Kostarev Kirill on 11.02.2024.
//

import SwiftUI

struct TextTimer: View {

    let dateRange: ClosedRange<Date>
    let font: UIFont
    let width: CGFloat

    init(_ dateRange: ClosedRange<Date>, font: UIFont, width: CGFloat? = nil) {
        self.dateRange = dateRange
        self.font = font
        self.width = width ?? TextTimer.defaultWidth(for: font)
    }

    var body: some View {
        Text(timerInterval: dateRange, showsHours: false)
            .font(Font(font))
            .frame(width: width > 0 ? width : nil)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
    }

    private static func defaultWidth(for font: UIFont) -> CGFloat {
        let maxString = "00:00"
        let fontAttributes = [NSAttributedString.Key.font: font]
        return (maxString as NSString).size(withAttributes: fontAttributes).width
    }

}
