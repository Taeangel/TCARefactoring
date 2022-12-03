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
    var showPortfolio: Bool = true
  }
  
  enum Action: Equatable {
    case onAppear
    case showPortfolioToggle
    case bindShowPortfolio
  }
  
  @Dependency(\.sideEffect.mainCoin) var sideEffect
  
  var body: some ReducerProtocol<State, Action> {
    
    Reduce { state, action in
      
      switch action {
      case .onAppear:
        state.paths = sideEffect.getPaths()
        return .none
        
      case .showPortfolioToggle:
        state.showPortfolio.toggle()
        return .none
        
      case .bindShowPortfolio:
        return .none
      }
    }
  }
}
