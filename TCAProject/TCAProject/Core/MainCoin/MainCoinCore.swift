//
//  MainCoinCore.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import ComposableArchitecture

struct MainCoinReducer: ReducerProtocol {
  struct State: Equatable {
    var paths: [String] = []
  }
  
  enum Action: Equatable {
    case getPaths
    case onTapSetting
  }
  
  @Dependency(\.sideEffect.mainCoin) var sideEffect
  
  var body: some ReducerProtocol<State, Action> {
    
    Reduce { state, action in
      
      switch action {
      case .getPaths:
        state.paths = sideEffect.getPaths()
        return .none
        
      case .onTapSetting:
        sideEffect.toSettingView()
        return .none
      }
    }
  }
}
