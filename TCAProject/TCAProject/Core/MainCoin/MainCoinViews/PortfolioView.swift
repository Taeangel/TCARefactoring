//
//  PortfolioView.swift
//  TCAProject
//
//  Created by song on 2022/12/03.
//

import SwiftUI
import ComposableArchitecture

struct PortfolioView: View {
  @ObservedObject var viewStore: ViewStoreOf<MainCoinReducer>
  
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

//struct PortfolioView_Previews: PreviewProvider {
//    static var previews: some View {
//        PortfolioView()
//    }
//}
