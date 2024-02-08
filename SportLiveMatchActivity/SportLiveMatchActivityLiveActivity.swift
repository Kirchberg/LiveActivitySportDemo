//
//  SportLiveMatchActivityLiveActivity.swift
//  SportLiveMatchActivity
//
//  Created by Kostarev Kirill on 03.02.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SportLiveMatchActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SportLiveMatchActivityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SportLiveMatchActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SportLiveMatchActivityAttributes {
    fileprivate static var preview: SportLiveMatchActivityAttributes {
        SportLiveMatchActivityAttributes(name: "World")
    }
}

extension SportLiveMatchActivityAttributes.ContentState {
    fileprivate static var smiley: SportLiveMatchActivityAttributes.ContentState {
        SportLiveMatchActivityAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SportLiveMatchActivityAttributes.ContentState {
         SportLiveMatchActivityAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SportLiveMatchActivityAttributes.preview) {
   SportLiveMatchActivityLiveActivity()
} contentStates: {
    SportLiveMatchActivityAttributes.ContentState.smiley
    SportLiveMatchActivityAttributes.ContentState.starEyes
}
