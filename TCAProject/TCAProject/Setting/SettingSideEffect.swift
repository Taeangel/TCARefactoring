//
//  MainCoinSideEffect.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import LinkNavigator

protocol SettingSideEffect {
  var getPaths: () -> [String] { get }
  var routeToBack: () -> Void { get }
}

struct SettingSideEffectLive {
  let navigator: LinkNavigatorType
  let service: ServiceProtocol
  
  init(navigator: LinkNavigatorType, service: ServiceProtocol) {
    self.navigator = navigator
    self.service = service
  }
}

extension SettingSideEffectLive: SettingSideEffect {
  var getPaths: () -> [String] {
    { navigator.currentPaths }
  }
  
  var routeToBack: () -> Void {
    { navigator.back(isAnimated: true) }
  }
}
