//
//  DashboardItemModel.swift
//  SmileMeats
//
//  Created by RAHUL PRADEV on 27/04/22.
//

import Foundation

struct DashboardItemModel: Codable, Hashable {
    var title: String
    var subTitle: String
}


extension DashboardItemModel {
    static var items: [DashboardItemModel] =
    [
        DashboardItemModel(title: "Chicken", subTitle: "Cooks some birds"),
        DashboardItemModel(title: "Mutton", subTitle: "Cooks some Mutton"),
        DashboardItemModel(title: "Fish", subTitle: "Cooks some Fish")
    ]
}
