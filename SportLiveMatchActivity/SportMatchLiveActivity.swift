//
//  SportMatchLiveActivity.swift
//  SportLiveMatchActivity
//
//  Created by Kostarev Kirill on 03.02.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SportMatchLiveActivity: Widget {

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SportEventMatchActivityAttributes.self) { context in
            sportEventMatchView(attributes: context.attributes, state: context.state)
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
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("M")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }

    // MARK: - Private Types

    private enum Constants {

        enum Layout {

            static let dotLiveInfoSize: CGFloat = 4.0
            static let imageSize: CGFloat = 28.0
            static let horizontalInset: CGFloat = 52.0
            static let verticalInset: CGFloat = 20.0
            static let horizontalSpacingTeamAndScore: CGFloat = 6.0
            static let verticalLiveInfoPadding: CGFloat = 8.0
            static let horizontalLiveInfoPadding: CGFloat = 4.0
            static let horizontalMatchLiveInfoPadding: CGFloat = 3.0

        }

    }

    // MARK: - Private Properties

    private func sportEventMatchView(attributes: SportEventMatchActivityAttributes, state: State) -> some View {
        HStack(spacing: 0) {
            sportEventTeamImageView(team: attributes.firstTeam)
            Spacer()
            sportEventMatchLiveInfoView(state: state)
            Spacer()
            sportEventTeamImageView(team: attributes.secondTeam)
        }
        .padding(.horizontal, Constants.Layout.horizontalInset)
        .padding(.vertical, Constants.Layout.verticalInset)
    }

    private func sportEventTeamImageView(team: SportEventMatchTeam) -> some View {
        VStack(spacing: Constants.Layout.horizontalSpacingTeamAndScore) {
            Image(uiImage: UIImage(data: team.image) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.Layout.imageSize, height: Constants.Layout.imageSize)
            Text(team.title)
                .font(.system(size: 16, weight: .medium))
        }
    }

    private func sportEventMatchLiveInfoView(state: State) -> some View {
        VStack(spacing: Constants.Layout.verticalLiveInfoPadding) {
            sportEventTeamScoreView(state: state)
            sportEventLiveScoreView(state: state)
        }
    }

    private func sportEventTeamScoreView(state: State) -> some View {
        Text("\(state.firstTeamScore) - \(state.secondTeamScore)")
            .font(.system(size: 34, weight: .regular))
    }

    private func sportEventLiveScoreView(state: State) -> some View {
        HStack(spacing: Constants.Layout.horizontalLiveInfoPadding) {
            sportEventLiveScoreDotView
            sportEventLiveScoreMatchInfoView(state: state)
        }
    }

    private func sportEventLiveScoreMatchInfoView(state: State) -> some View {
        HStack(spacing: Constants.Layout.horizontalMatchLiveInfoPadding) {
            TextTimer(state.timeInfo, font: .systemFont(ofSize: 12, weight: .regular))

            Text("\(state.matchInfo)")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.gray)
        }
    }

    private var sportEventLiveScoreDotView: some View {
        Circle()
            .fill(.red)
            .frame(width: Constants.Layout.dotLiveInfoSize, height: Constants.Layout.dotLiveInfoSize)
    }

}

extension SportEventMatchActivityAttributes {

    fileprivate static var firstPreview: SportEventMatchActivityAttributes {
        return SportEventMatchActivityAttributes(
            firstTeam: .Examples.zenitTeam,
            secondTeam: .Examples.spartakTeam,
            matchTitle: "Example"
        )
    }

    fileprivate static var secondPreview: SportEventMatchActivityAttributes {
        return SportEventMatchActivityAttributes(
            firstTeam: .Examples.romaTeam,
            secondTeam: .Examples.empoliTeam,
            matchTitle: "Example"
        )
    }

}

extension SportEventMatchActivityAttributes.ContentState {
    fileprivate static var firstState: SportEventMatchActivityAttributes.ContentState {
        return SportEventMatchActivityAttributes.ContentState(
            timeInfo: Date.now...Date(timeInterval: 120 * 60, since: .now),
            firstTeamScore: "1",
            secondTeamScore: "1",
            matchInfo: "- 1nd half"
        )
    }

    fileprivate static var secondState: SportEventMatchActivityAttributes.ContentState {
        return SportEventMatchActivityAttributes.ContentState(
            timeInfo: Date.now...Date(timeInterval: 60 * 60, since: .now),
            firstTeamScore: "3",
            secondTeamScore: "2",
            matchInfo: "- 2nd half"
        )
    }
}

#Preview("Notification", as: .content, using: SportEventMatchActivityAttributes.secondPreview) {
    SportMatchLiveActivity()
} contentStates: {
    SportEventMatchActivityAttributes.ContentState.firstState
    SportEventMatchActivityAttributes.ContentState.secondState
}
