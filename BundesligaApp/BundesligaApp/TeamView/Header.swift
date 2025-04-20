//
//  Header.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 13/04/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct Header: View {
    var name: String
    var url: String
    var round: Bool = true
    
    var body: some View {
            VStack {
                if round {
                    WebImage(url: URL(string: url))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                } else {
                    WebImage(url: URL(string: url))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 64, height: 64)
                }
                Text("\(name)")
                    .font(.custom("BebasNeue-Regular", size: 30))
            }
        }
}
