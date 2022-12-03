//
//  AppSideEffect.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import LinkNavigator
import Dependencies
import Foundation

struct EmptyDependency: DependencyType {}

fileprivate struct ServiceDependency {
  let coinDataService: coinServiceProtocol = CoinDataService()
}

fileprivate var navigator: LinkNavigatorType = LinkNavigator(
  dependency: EmptyDependency(),
  builders: AppRouterGroup().routers)

fileprivate let serivceDependency =  ServiceDependency()

 struct AppSideEffect: DependencyKey {
      
  let linkNavigator: LinkNavigatorType
  
  let mainCoin: MainCoinSideEffect
  let setting: SettingSideEffect
  
   static var liveValue: AppSideEffect {
    return .init(linkNavigator: navigator,
                 mainCoin: MainCoinSideEffectLive(navigator: navigator, coinDataService: serivceDependency.coinDataService),
                 setting: SettingSideEffectLive(navigator: navigator, service: serivceDependency.coinDataService))
  }
}

extension DependencyValues {
  var sideEffect: AppSideEffect {
    get {self[AppSideEffect.self] }
    set { self[AppSideEffect.self] = newValue }
  }
}
