import SwiftUICore
import SwiftUI
import SDWebImageSwiftUI

struct ListTile: View {
    var teamName: String
    var teamLogo: String
    var position: Int
    var points: Int
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text("\(position)")
                    .frame(width: geometry.size.width * 0.08)
                
                WebImage(url: URL(string: teamLogo))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text(teamName)
                    .frame(width: geometry.size.width * 0.65, alignment: .leading)
                Text("\(points)")
                    .frame(width: geometry.size.width * 0.15, alignment: .leading)
                    
                Spacer()
            }
            .frame(maxHeight: .infinity)
        }
    }
}
