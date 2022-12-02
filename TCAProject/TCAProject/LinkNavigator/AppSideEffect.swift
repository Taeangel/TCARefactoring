//
//  AppSideEffect.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import LinkNavigator
import Dependencies
import Foundation


struct AppDependency: DependencyType {}

fileprivate var navigator: LinkNavigatorType = LinkNavigator(
  dependency: AppDependency(),
  builders: AppRouterGroup().routers)

public struct AppSideEffect: DependencyKey {
  
  let linkNavigator: LinkNavigatorType
  
  public static var liveValue: AppSideEffect {
    return .init(linkNavigator: navigator)
  }
}

extension DependencyValues {
  var sideEffect: AppSideEffect {
    get {self[AppSideEffect.self] }
  }
}
