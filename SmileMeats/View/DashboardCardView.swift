//
//  DashboardCardView.swift
//  SmileMeats
//
//  Created by RAHUL PRADEV on 27/04/22.
//

import Foundation
import SwiftUI

struct DashboardCardView: View {
    
    let dashboardItem: DashboardItemModel
    
    var cardSize: CGSize
    
    public init(dashboardItem: DashboardItemModel, cardSize: CGSize) {
        self.dashboardItem = dashboardItem
        self.cardSize = cardSize
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(dashboardItem.title)
                .kerning(1)
                .cornerRadius(5)
                .padding([.top, .leading, .trailing], 15)
            Spacer()
            Text(dashboardItem.subTitle)
                .font(Font.system(size: 14.0, weight: .regular, design: .default))
                .foregroundColor(.gray)
                .padding([.bottom, .leading, .trailing], 15)
            //padding(.bottom, 10)
        }
        .frame(width: cardSize.width - 25, height: cardSize.height + 30, alignment: .leading)
            .modifier(SMBorderModifier(10))
            .padding(.bottom, 15)
    }
}

struct CardView_Previews: PreviewProvider {
    static var item = DashboardItemModel.items[0]
    static var previews: some View {
        DashboardCardView(dashboardItem: item, cardSize: CGSize(width: 200, height: 200))
            .background(Color.green)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
