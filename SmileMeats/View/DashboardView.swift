//
//  DashboardView.swift
//  SmileMeats
//
//  Created by RAHUL PRADEV on 27/04/22.
//

import Foundation
import SwiftUI

var dashboardList = ["Apple", "Banana", "Cat"]

struct DashboardView: View {
    @State var isShowing: Bool = false
    
    var body: some View {
        DashboardItemList
            .onTapGesture {
                isShowing = true
            }
            .toast(isShowing: $isShowing, ontap: {
                isShowing = false
            })
    }
}

//Dashboard list
var DashboardItemList: some View {
    ScrollView(.vertical, showsIndicators: false) {
        LazyVStack{
            ForEach(DashboardItemModel.items, id: \.self) { item in
                DashboardCardView(dashboardItem: item, cardSize: CGSize(width: .screenWidth - .horizontalPadding, height: .privateCardHeight))
                    //.background(.green)
                    //.modifier(SMBorderModifier(10))
            }
        }
        //.background(.blue)
    }
    .padding([.leading, .trailing], .horizontalPadding)
    
}

public struct SMBorderModifier: ViewModifier {
    //var style: CUIBorderInput
    var radius: CGFloat
    var lineWidth: CGFloat?
    var lineColor: Color?
    var bgColor: Color?
    
    public init(_ radius: CGFloat, lineWidth: CGFloat? = nil, lineColor: Color? = nil, bgColor: Color? = nil) {
        self.radius = radius
        self.lineColor = lineColor
        self.lineWidth = lineWidth
        self.bgColor = bgColor
    }

    public func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(
                    cornerRadius: self.radius,
                    style: .circular
                ).stroke(.blue, lineWidth: lineWidth ?? 1)
            )
    }
}

enum Theme: String {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
}


fileprivate extension CGFloat {
    static let screenWidth: CGFloat = Double(UIScreen.main.bounds.width)
    static let cardAspectRatio: CGFloat = 5/7
    static let privateCardWidth: CGFloat = screenWidth * cardAspectRatio
    static let horizontalPadding: CGFloat = 20.0
    static let privateCardHeight: CGFloat = 50
    //privateCardWidth / cardAspectRatio
}
