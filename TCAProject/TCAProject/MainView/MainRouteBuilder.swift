//
//  MainRouteBuilder.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import LinkNavigator
import SwiftUI

struct HomeRouteBuilder: RouteBuilder {
  var matchPath: String { "home" }

  var build: (LinkNavigatorType, [String: String], DependencyType) -> UIViewController? {
    { navigator, items, dependency in
      return WrappingController(matchingKey: matchPath) {
        AnyView(HomePage(navigator: navigator))
      }
    }
  }
}
