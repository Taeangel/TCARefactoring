//
//  ContentView.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//
import SwiftUI
import ComposableArchitecture

struct MainCoinView: View {
  
  private let store: StoreOf<MainCoinReducer>
  @ObservedObject var viewStore: ViewStoreOf<MainCoinReducer>
  
  init(store: StoreOf<MainCoinReducer>) {
    self.store = store
    viewStore = ViewStore(store)
  }
  
  var body: some View {
    VStack {
      
      
      Text("MainView입니다.")
      
      Button("SettingView이동 버튼 입니다.") {
        viewStore.send(.onTapSetting)
      }
      
      
      
    }
    .onAppear {
      viewStore.send(.getPaths)
    }
    
  }
}
