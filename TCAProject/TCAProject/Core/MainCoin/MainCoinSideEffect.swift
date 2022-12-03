//
//  MainCoinSideEffect.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import LinkNavigator

protocol MainCoinSideEffect {
  var getPaths: () -> [String] { get }
  var toSettingView: () -> Void { get }
  
}

struct MainCoinSideEffectLive {
  let navigator: LinkNavigatorType
  let coinDataService: coinServiceProtocol
  
  init(navigator: LinkNavigatorType,
       coinDataService: coinServiceProtocol
  ) {
    self.navigator = navigator
    self.coinDataService = coinDataService
  }
}

extension MainCoinSideEffectLive: MainCoinSideEffect {
  var getPaths: () -> [String] {
    { navigator.currentPaths }
  }
  
  var toSettingView: () -> Void {
    { navigator.next(paths: ["setting"], items: [:], isAnimated: true) }
  }
  

}
 
