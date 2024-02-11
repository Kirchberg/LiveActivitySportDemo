//
//  Model.swift
//  SportLiveMatchActivityExtension
//
//  Created by Kostarev Kirill on 10.02.2024.
//

import UIKit
import Foundation
import ActivityKit
import WidgetKit

typealias State = SportEventMatchActivityAttributes.ContentState
typealias Context = ActivityViewContext<SportEventMatchActivityAttributes>

struct SportEventMatchActivityAttributes: ActivityAttributes {
    struct ContentState: Codable, Hashable {
        let timeInfo: ClosedRange<Date>
        let firstTeamScore: String
        let secondTeamScore: String
        let matchInfo: String
    }
    let firstTeam: SportEventMatchTeam
    let secondTeam: SportEventMatchTeam
    let matchTitle: String
}

struct SportEventMatchTeam: Codable {
    let title: String
    let image: Data
}

extension SportEventMatchTeam {

    enum Examples {

        static let zenitTeam = SportEventMatchTeam(
            title: "Zenit",
            image: UIImage(named: "zenit_logo")!.pngData()!
        )

        static let spartakTeam = SportEventMatchTeam(
            title: "Spartak",
            image: UIImage(named: "spartak_logo")!.pngData()!
        )

        static let juventusTeam = SportEventMatchTeam(
            title: "JUV",
            image: UIImage(named: "juventus_logo")!.pngData()!
        )

        static let sampdoriaTeam = SportEventMatchTeam(
            title: "SAM",
            image: UIImage(named: "sampdoria_logo")!.pngData()!
        )

        static let empoliTeam = SportEventMatchTeam(
            title: "EMP",
            image: UIImage(named: "empoli_logo")!.pngData()!
        )

        static let romaTeam = SportEventMatchTeam(
            title: "ROM",
            image: UIImage(named: "roma_logo")!.pngData()!
        )

    }

}
