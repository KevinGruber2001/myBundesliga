//
//  OverviewPageHeader.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct OverviewPageHeader: View {
    var url: String
    var label: String

    var body: some View {
        WebImage(url: URL(string: url))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 128, height: 128)
      
        Text("\(label)")
            .font(.title)
    }
}

#Preview {
    OverviewPageHeader(url: "https://picsum.photos/200/300.jpg", label: "Test")
}
