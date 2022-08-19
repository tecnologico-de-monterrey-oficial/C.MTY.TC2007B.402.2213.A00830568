//
//  CustomTabView.swift
//  App04-TMDB
//
//  Created by Edgar Alexandro on 18/08/22.
//

//import SwiftUI
//
//struct CustomTabView: View {
//
//    enum MenuOpc{
//        case movies
//        case series
//    }
//
//    @State var menu: MenuOpc = .movies
//
//    var body: some View {
//        ZStack{
//            VStack{
//                switch menu {
//                case .movies:
//                    MoviesView()
//                case .series:
//                    SeriesView()
//                }
//            }
//            VStack{
//                Spacer()
//                HStack{
//                    Spacer()
//                    Button{
//                        menu = .movies
//                    } label: {
//                        Text("Movies")
//                    }
//                    Spacer()
//                    Button{
//                        menu = .series
//                    } label: {
//                        Text("Series")
//                    }
//                    Spacer()
//                }
//            }
//        }
//    }
//}
//
//struct CustomTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView()
//    }
//}
